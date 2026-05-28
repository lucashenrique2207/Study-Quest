import 'dart:math';
import 'package:flutter/material.dart';
import 'package:study_quest/Widgets/drawer.dart';

const List<String> weekDays = ['SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SAB', 'DOM'];
const List<int> chestReward = [15, 15, 20, 20, 25, 30, 60];
const int initialTodayIdx = 3;

const Color bgColor      = Color(0xFF0F0F1A);
const Color surfaceColor = Color(0xFF1A1A2E);
const Color blueColor    = Color(0xFF1565C0);
const Color blueLight    = Color(0xFF1976D2);
const Color paleColor    = Color(0xFFBBDEFB);
const Color accColor     = Color(0xFF4FC3F7);
const Color goldColor    = Color(0xFFFFD700);
const Color mutedColor   = Color(0x73FFFFFF);
const Color borderColor  = Color(0x1AFFFFFF);
const Color greenColor   = Color(0xFF90EE90);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gustavo Dias',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        fontFamily: 'sans-serif',
        colorScheme: const ColorScheme.dark(surface: surfaceColor),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int streak   = 7;
  int crystals = 991;
  int todayIdx = initialTodayIdx;
  bool weekComplete = false;
  bool showConfetti = false;
  bool crystalBump  = false;

  List<bool> activity  = [true, true, true, false, false, false, false];
  List<bool> collected = [true, true, true, false, false, false, false];

  int segue      = 0;
  int seguidores = 0;
  int materias   = 8;

  String toastMsg   = '';
  bool toastVisible = false;
  bool toastGold    = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _badgeController;

  @override
  void initState() {
    super.initState();
    _badgeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
  }

  @override
  void dispose() {
    _badgeController.dispose();
    super.dispose();
  }

  void _showToast(String msg, {bool gold = false}) {
    setState(() {
      toastMsg     = msg;
      toastVisible = true;
      toastGold    = gold;
    });
    Future.delayed(const Duration(milliseconds: 2700), () {
      if (mounted) setState(() => toastVisible = false);
    });
  }

  void _bumpBadge() {
    _badgeController.forward(from: 0);
    setState(() => crystalBump = true);
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) setState(() => crystalBump = false);
    });
  }

  void _doActivity() {
    if (activity[todayIdx]) {
      _showToast('✅ Atividade já feita hoje!');
      return;
    }

    final newActivity  = List<bool>.from(activity)..[todayIdx] = true;
    final newCollected = List<bool>.from(collected)..[todayIdx] = true;
    final reward       = chestReward[todayIdx];
    final isWeekDone   = newActivity.every((v) => v);

    setState(() {
      activity   = newActivity;
      collected  = newCollected;
      streak     = streak + 1;
      crystals   = crystals + reward;
    });

    _bumpBadge();

    if (isWeekDone && !weekComplete) {
      setState(() {
        weekComplete = true;
        showConfetti = true;
      });
      Future.delayed(const Duration(milliseconds: 4500), () {
        if (mounted) setState(() => showConfetti = false);
      });
      _showToast('🏆 SEMANA COMPLETA! +${reward}💎 creditados!', gold: true);
    } else {
      _showToast('💎 +$reward cristais! Baú de ${weekDays[todayIdx]} aberto!', gold: true);
    }

    if (todayIdx < 6) {
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) setState(() => todayIdx = todayIdx + 1);
      });
    }
  }

  int get weekCrystals {
    int total = 0;
    for (int i = 0; i < 7; i++) {
      if (collected[i]) total += chestReward[i];
    }
    if (activity[todayIdx] && !collected[todayIdx]) {
      total += chestReward[todayIdx];
    }
    return total;
  }

  int get totalPossible => chestReward.reduce((a, b) => a + b);
  double get pct => weekCrystals / totalPossible;
  bool get todayDone => activity[todayIdx];
  bool get allDone => activity.every((v) => v);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgColor,
      drawer: MeuDrawer
      body: Stack(
        children: [
          _buildOrb(420, const Color(0xFF1565C0), -120, -100),
          _buildOrb(320, const Color(0xFF4FC3F7), null, -60, bottom: -60),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(),
                  _buildAvatar(),
                  _buildBody(),
                ],
              ),
            ),
          ),
          if (showConfetti) const _ConfettiWidget(),
          _buildToast(),
        ],
      ),
    );
  }

  Widget _buildOrb(double size, Color color, double? top, double? left,
      {double? bottom, double? right}) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.08),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1976D2), Color(0xFF1565C0)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Gustavo Dias',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          Row(
            children: [
              AnimatedScale(
                scale: crystalBump ? 1.22 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0x26FFD700),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0x59FFD700)),
                  ),
                  child: Row(
                    children: [
                      const Text('💎 ', style: TextStyle(fontSize: 14)),
                      Text(
                        _formatNumber(crystals),
                        style: const TextStyle(
                          color: goldColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => _scaffoldKey.currentState?.openDrawer(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.15)),
                  ),
                  child: const Center(
                    child: Text('⚙️', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      color: blueColor,
      padding: const EdgeInsets.only(bottom: 32, top: 8),
      child: Center(
        child: GestureDetector(
          onTap: () => _showToast('📸 Trocar foto em breve!'),
          child: Stack(
            alignment: Alignment.center,
            children: [
              _SpinningRing(size: 130),
              Container(
                width: 118,
                height: 118,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: paleColor,
                ),
                child: const Center(
                  child: Text('😊', style: TextStyle(fontSize: 60)),
                ),
              ),
              Positioned(
                bottom: 6,
                right: 6,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50),
                    shape: BoxShape.circle,
                    border: Border.all(color: blueColor, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: const BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '@GUSTTTAVODIAS · AQUI DESDE 2026',
            style: TextStyle(
              fontSize: 11,
              letterSpacing: 2,
              color: mutedColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 22),
          _buildStatsRow(),
          const Divider(color: borderColor, height: 28),
          _buildActionRow(),
          const SizedBox(height: 8),
          _sectionLabel('SEQUÊNCIA'),
          _buildStreakWidget(),
          if (allDone) _buildWeekBanner(),
          _buildActivityButton(),
          _sectionLabel('VISÃO GERAL'),
          _buildOverviewGrid(),
          _sectionLabel('BAÚS SEMANAIS'),
          _buildChestSection(),
          _buildRecoveryCard(),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _statItem('🧮', materias.toString(), 'Matérias'),
        _statItem(null, segue.toString(), 'Segue'),
        _statItem(null, seguidores.toString(), 'Seguidores'),
      ],
    );
  }

  Widget _statItem(String? icon, String val, String lbl) {
    return GestureDetector(
      onTap: () => _showToast('$lbl: $val'),
      child: Column(
        children: [
          if (icon != null)
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: blueColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: blueColor.withOpacity(0.4)),
              ),
              child: Center(child: Text(icon, style: const TextStyle(fontSize: 15))),
            ),
          if (icon != null) const SizedBox(height: 4),
          Text(
            val,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          Text(lbl, style: const TextStyle(fontSize: 11, color: mutedColor)),
        ],
      ),
    );
  }

  Widget _buildActionRow() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() => segue++);
              _showToast('✅ Convite enviado!');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 13),
              decoration: BoxDecoration(
                color: blueColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: blueColor.withOpacity(0.4)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('➕ ', style: TextStyle(fontSize: 14)),
                  Text(
                    'ADICIONAR AMIGOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => _showQrModal(),
          child: Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: blueColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: blueColor.withOpacity(0.4)),
            ),
            child: const Center(child: Text('📲', style: TextStyle(fontSize: 20))),
          ),
        ),
      ],
    );
  }

  Widget _buildStreakWidget() {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0x1AFF8C00), Color(0x0FFF4500)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0x40FF8C00)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text('🔥', style: TextStyle(fontSize: 44)),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$streak',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFFF8C00),
                      height: 1,
                    ),
                  ),
                  const Text(
                    'dias seguidos',
                    style: TextStyle(fontSize: 12, color: mutedColor),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: List.generate(7, (i) {
              final done    = activity[i];
              final isToday = i == todayIdx && !done;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  children: [
                    Text(
                      weekDays[i][0],
                      style: const TextStyle(
                        fontSize: 8,
                        color: mutedColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: done
                            ? const Color(0x33FF8C00)
                            : isToday
                                ? const Color(0x26FFD700)
                                : Colors.white.withOpacity(0.04),
                        border: Border.all(
                          color: done
                              ? const Color(0xFFFF8C00)
                              : isToday
                                  ? goldColor
                                  : Colors.white.withOpacity(0.12),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          done ? '🔥' : '·',
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0x26FFD700), Color(0x14FF8C00)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0x80FFD700), width: 2),
      ),
      child: Row(
        children: [
          const Text('🏆', style: TextStyle(fontSize: 40)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Semana 100% completa!',
                  style: TextStyle(
                    color: goldColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Todos os $totalPossible 💎 foram creditados. Incrível, Gustavo!',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.6),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityButton() {
    if (todayDone) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: const Color(0x144CAF50),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0x334CAF50)),
        ),
        child: Column(
          children: [
            const Text(
              '✅ Atividade de hoje concluída!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: greenColor,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '+${chestReward[todayIdx]} 💎 creditados automaticamente',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: Colors.white.withOpacity(0.4),
              ),
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: _doActivity,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0x33FF8C00), Color(0x1FFF4500)],
          ),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0x80FF8C00), width: 2),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('📚', style: TextStyle(fontSize: 22)),
            SizedBox(width: 10),
            Text(
              'Fazer atividade de hoje!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ),
            ),
            SizedBox(width: 10),
            Text('🔥', style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewGrid() {
    final cards = [
      {'em': '🔥', 'val': '$streak dias', 'lbl': 'consecutivos', 'msg': '🔥 Continue sua sequência!'},
      {'em': '💎', 'val': _formatNumber(crystals), 'lbl': 'cristais', 'msg': '💎 Ganhe cristais fazendo atividades!'},
      {'em': '📘', 'val': '$materias', 'lbl': 'matérias', 'msg': '📘 Continue estudando!'},
    ];
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Row(
        children: cards.map((c) {
          return Expanded(
            child: GestureDetector(
              onTap: () => _showToast(c['msg']!),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  children: [
                    Text(c['em']!, style: const TextStyle(fontSize: 28)),
                    const SizedBox(height: 5),
                    Text(
                      c['val']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      c['lbl']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10, color: mutedColor),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildChestSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 22),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0x12FFD700), Color(0x0AB8860B)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0x33FFD700)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '⚔️ Recompensas da Semana',
                style: TextStyle(
                  color: goldColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
              Text(
                '${(pct * 100).round()}%',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xBFFFD700),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Faça atividades e os diamantes são creditados automaticamente.\nDomingo = Baú de Ouro (+60 💎)!',
            style: TextStyle(
              fontSize: 11,
              color: Colors.white.withOpacity(0.45),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 6,
              backgroundColor: Colors.white.withOpacity(0.06),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: List.generate(
              7,
              (i) => Expanded(
                child: _ChestCard(
                  dayIdx: i,
                  isCollected: collected[i],
                  activityDone: activity[i],
                  isToday: i == todayIdx,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Center(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 12, color: mutedColor),
                children: [
                  const TextSpan(text: 'Esta semana: '),
                  TextSpan(
                    text: '$weekCrystals / $totalPossible 💎',
                    style: const TextStyle(
                      color: goldColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecoveryCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0x0FFF5757),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0x33FF5757)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('🛡️', style: TextStyle(fontSize: 24)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Proteção de Sequência',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 11,
                      color: mutedColor,
                      height: 1.6,
                    ),
                    children: [
                      const TextSpan(text: 'Perdeu um dia? Gaste '),
                      const TextSpan(
                        text: '50 💎',
                        style: TextStyle(
                          color: goldColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(text: ' para recuperar! '),
                      TextSpan(
                        text: crystals >= 50
                            ? 'Você tem cristais suficientes ✓'
                            : 'Abra mais baús para acumular cristais.',
                        style: TextStyle(
                          color: crystals >= 50
                              ? const Color(0xFF90EE90)
                              : const Color(0xFFFF7070),
                        ),
                      ),
                    ],
                  ),
                ),
                if (crystals >= 50) ...[
                  const SizedBox(height: 9),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        crystals -= 50;
                        streak++;
                      });
                      _bumpBadge();
                      _showToast('🛡️ Streak recuperado! −50 💎');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0x26FF6464),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0x4DFF6464)),
                      ),
                      child: const Text(
                        'Recuperar streak (−50 💎)',
                        style: TextStyle(
                          color: Color(0xFFFF9090),
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToast() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      curve: Curves.elasticOut,
      bottom: toastVisible ? 32 : -80,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
          decoration: BoxDecoration(
            color: toastGold ? const Color(0xF72A2010) : const Color(0xF70F0F1A),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: toastGold
                  ? const Color(0x66FFD700)
                  : const Color(0x404FC3F7),
            ),
          ),
          child: Text(
            toastMsg,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  void _showQrModal() {
    const qr = [
      [1,1,1,1,1,1,1],
      [1,0,0,0,0,0,1],
      [1,0,1,1,1,0,1],
      [1,0,1,0,1,0,1],
      [1,0,1,1,1,0,1],
      [1,0,0,0,0,0,1],
      [1,1,1,1,1,1,1],
    ];
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: surfaceColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Meu QR Code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                'Compartilhe seu perfil',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.45),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: 150,
                height: 150,
                child: GridView.count(
                  crossAxisCount: 7,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  children: [
                    for (final row in qr)
                      for (final cell in row)
                        Container(
                          decoration: BoxDecoration(
                            color: cell == 1 ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '@gustttavodias',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.pop(ctx),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: blueColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: blueColor.withOpacity(0.4)),
                  ),
                  child: const Center(
                    child: Text(
                      'Fechar',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          letterSpacing: 3,
          color: mutedColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _formatNumber(int n) {
    if (n >= 1000) {
      return n.toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (m) => '.',
      );
    }
    return n.toString();
  }
}

// ═══════════════════════════════════════════════════════════
// SPINNING RING
// ═══════════════════════════════════════════════════════════
class _SpinningRing extends StatefulWidget {
  final double size;
  const _SpinningRing({required this.size});
  @override
  State<_SpinningRing> createState() => _SpinningRingState();
}

class _SpinningRingState extends State<_SpinningRing>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }
  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _ctrl,
      child: Container(
        width: widget.size + 8,
        height: widget.size + 8,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: SweepGradient(
            colors: [accColor, blueLight, Colors.transparent],
            stops: [0.0, 0.4, 0.4],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// CHEST CARD
// ═══════════════════════════════════════════════════════════
class _ChestCard extends StatelessWidget {
  final int dayIdx;
  final bool isCollected;
  final bool activityDone;
  final bool isToday;

  const _ChestCard({
    required this.dayIdx,
    required this.isCollected,
    required this.activityDone,
    required this.isToday,
  });

  @override
  Widget build(BuildContext context) {
    final reward = chestReward[dayIdx];
    final isGold = dayIdx == 6;
    final isDone = isCollected || activityDone;

    Color borderC;
    List<Color> gradColors;
    Color ptsColor;

    if (isDone) {
      if (isGold) {
        borderC    = const Color(0x80FFD700);
        gradColors = const [Color(0xFF2A2010), Color(0xFF1A1408)];
        ptsColor   = goldColor;
      } else {
        borderC    = const Color(0x6490EE90);
        gradColors = const [Color(0xFF1E3A1E), Color(0xFF0F2410)];
        ptsColor   = greenColor;
      }
    } else if (isToday) {
      borderC    = const Color(0x9964DC64);
      gradColors = const [Color(0xFF1A2E1A), Color(0xFF0D2010)];
      ptsColor   = greenColor;
    } else {
      borderC    = const Color(0x12FFFFFF);
      gradColors = const [Color(0xFF111827), Color(0xFF111827)];
      ptsColor   = mutedColor;
    }

    final icon = isDone
        ? (isGold ? '🏆' : '📦')
        : isToday
            ? (isGold ? '🏆' : '📦')
            : '🔒';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        children: [
          Text(
            weekDays[dayIdx],
            style: const TextStyle(
              fontSize: 8,
              letterSpacing: 1,
              color: mutedColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Opacity(
            opacity: (!isDone && !isToday) ? 0.45 : 1.0,
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradColors,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderC),
                boxShadow: isDone || isToday
                    ? [
                        BoxShadow(
                          color: isGold
                              ? const Color(0x59FFD700)
                              : const Color(0x4064DC64),
                          blurRadius: 14,
                        ),
                      ]
                    : [],
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(icon, style: const TextStyle(fontSize: 18)),
                        Text(
                          isDone ? '✓+$reward💎' : '+$reward💎',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                            color: ptsColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isDone)
                    Positioned(
                      top: 2,
                      right: 2,
                      child: Container(
                        width: 13,
                        height: 13,
                        decoration: const BoxDecoration(
                          color: Color(0xFF4CAF50),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text('✓', style: TextStyle(fontSize: 7, color: Colors.white)),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// CONFETTI
// ═══════════════════════════════════════════════════════════
class _ConfettiWidget extends StatefulWidget {
  const _ConfettiWidget();
  @override
  State<_ConfettiWidget> createState() => _ConfettiWidgetState();
}

class _ConfettiWidgetState extends State<_ConfettiWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late List<_ConfettiPiece> pieces;
  final rng = Random();

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    )..forward();

    const colors = [
      Color(0xFFFF8C00), Color(0xFFFFD700), Color(0xFFFF4500),
      Color(0xFF90EE90), Color(0xFF4FC3F7), Color(0xFFFF69B4),
    ];

    pieces = List.generate(50, (_) => _ConfettiPiece(
      x: rng.nextDouble(),
      delay: rng.nextDouble() * 1.8,
      duration: 2.5 + rng.nextDouble() * 2,
      color: colors[rng.nextInt(colors.length)],
      size: 6 + rng.nextDouble() * 9,
    ));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) {
        return Stack(
          children: pieces.map((p) {
            final elapsed = _ctrl.value * 4.5;
            final t = ((elapsed - p.delay) / p.duration).clamp(0.0, 1.0);
            if (t <= 0) return const SizedBox();
            return Positioned(
              left: p.x * size.width,
              top: t * size.height,
              child: Opacity(
                opacity: (1 - t).clamp(0.0, 1.0),
                child: Transform.rotate(
                  angle: t * 4 * pi,
                  child: Container(
                    width: p.size,
                    height: p.size,
                    decoration: BoxDecoration(
                      color: p.color,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _ConfettiPiece {
  final double x, delay, duration, size;
  final Color color;
  const _ConfettiPiece({
    required this.x,
    required this.delay,
    required this.duration,
    required this.color,
    required this.size,
  });
}