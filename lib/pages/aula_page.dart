import 'package:flutter/material.dart';
import 'package:studyquest/Widgets/drawer.dart';

class AulasApp extends StatelessWidget {
  const AulasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aulas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFF0D1B3E),
      ),
      home: const AulasPage(),
    );
  }
}

// ─── Data Model ───────────────────────────────────────────────────────────────

class Materia {
  final String nome;
  final int totalAulas;
  final double progresso; // 0.0 a 1.0
  final Color cor;
  final IconData icone;
  final Color iconeBg;

  const Materia({
    required this.nome,
    required this.totalAulas,
    required this.progresso,
    required this.cor,
    required this.icone,
    required this.iconeBg,
  });
}

const List<Materia> materias = [
  Materia(
    nome: 'Matemática',
    totalAulas: 12,
    progresso: 0.01,
    cor: Color(0xFF4A9EFF),
    icone: Icons.calculate_rounded,
    iconeBg: Color(0xFF3A7FDD),
  ),

  Materia(
    nome: 'Português',
    totalAulas: 10,
    progresso: 0.01,
    cor: Color(0xFFAB6EF5),
    icone: Icons.menu_book_rounded,
    iconeBg: Color(0xFF7C4DB8),
  ),

  Materia(
    nome: 'História',
    totalAulas: 8,
    progresso: 0.01,
    cor: Color(0xFFFF8C42),
    icone: Icons.account_balance_rounded,
    iconeBg: Color(0xFFD4662A),
  ),

  Materia(
    nome: 'Geografia',
    totalAulas: 9,
    progresso: 0.01,
    cor: Color(0xFF4CC97A),
    icone: Icons.public_rounded,
    iconeBg: Color(0xFF2E9E57),
  ),
  Materia(
    nome: 'Ciências',
    totalAulas: 11,
    progresso: 0.01,
    cor: Color(0xFFFF5E8A),
    icone: Icons.science_rounded,
    iconeBg: Color(0xFFCC3060),
  ),
  Materia(
    nome: 'Inglês',
    totalAulas: 15,
    progresso: 0.01,
    cor: Color(0xFFFFCC33),
    icone: Icons.chat_bubble_rounded,
    iconeBg: Color(0xFFD4A010),
  ),
];

// ─── Main Page ────────────────────────────────────────────────────────────────

class AulasPage extends StatefulWidget {
  const AulasPage({super.key});

  @override
  State<AulasPage> createState() => _AulasPageState();
}

class _AulasPageState extends State<AulasPage> {
  int _selectedTab = 1; // Aulas is tab index 1

  void _onTabTap(int index) {
    setState(() => _selectedTab = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B3E),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: materias.length,
                itemBuilder: (context, index) => MateriaCard(
                  materia: materias[index],
                  animationDelay: Duration(milliseconds: 80 * index),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ── Header ────────────────────────────────────────────────────────────────

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFF4A9EFF),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
              onPressed: () {
                // Navigation back
                if (Navigator.canPop(context)) Navigator.pop(context);
              },
            ),
          ),

          // Title + subtitle
          Expanded(
            child: Column(
              children: const [
                SizedBox(height: 2),
                Text(
                  'Aulas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Escolha uma matéria para continuar\nseus estudos!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFB0C4DE),
                    fontSize: 13.5,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          // Bear mascot
          const _BearMascot(),
        ],
      ),
    );
  }

  // ── Bottom Nav ────────────────────────────────────────────────────────────

  Widget _buildBottomNav() {
    const tabs = [
      _NavItem(icon: Icons.star_rounded, label: 'Início'),
      _NavItem(icon: Icons.menu_book_rounded, label: 'Aulas'),
      _NavItem(icon: Icons.local_fire_department_rounded, label: 'Desafios'),
      _NavItem(icon: Icons.person_rounded, label: 'Perfil'),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0D1B3E),
        border: Border(top: BorderSide(color: Color(0xFF1E2F55), width: 1)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(tabs.length, (i) {
              final selected = i == _selectedTab;
              return GestureDetector(
                onTap: () => _onTabTap(i),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        tabs[i].icon,
                        color: selected
                            ? const Color(0xFF4A9EFF)
                            : const Color(0xFF4A5E7A),
                        size: 24,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        tabs[i].label,
                        style: TextStyle(
                          color: selected
                              ? const Color(0xFF4A9EFF)
                              : const Color(0xFF4A5E7A),
                          fontSize: 11,
                          fontWeight: selected
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

// ─── Bear Mascot ──────────────────────────────────────────────────────────────

class _BearMascot extends StatelessWidget {
  const _BearMascot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: const Color(0xFF1A2E5A),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF2A4070), width: 2),
      ),
      child: ClipOval(
        child: CustomPaint(
          painter: _BearPainter(),
        ),
      ),
    );
  }
}

class _BearPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    // Body / face (tan)
    final facePaint = Paint()..color = const Color(0xFFD4935A);
    canvas.drawCircle(Offset(cx, cy + 4), size.width * 0.38, facePaint);

    // Ears
    canvas.drawCircle(Offset(cx - 18, cy - 14), 10, facePaint);
    canvas.drawCircle(Offset(cx + 18, cy - 14), 10, facePaint);
    // Inner ears
    final innerEarPaint = Paint()..color = const Color(0xFFE8A87C);
    canvas.drawCircle(Offset(cx - 18, cy - 14), 6, innerEarPaint);
    canvas.drawCircle(Offset(cx + 18, cy - 14), 6, innerEarPaint);

    // Graduation cap
    final capPaint = Paint()..color = const Color(0xFF1A3A8A);
    final capRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(cx, cy - 12), width: 36, height: 10),
      const Radius.circular(2),
    );
    canvas.drawRRect(capRect, capPaint);
    canvas.drawRect(
      Rect.fromCenter(center: Offset(cx, cy - 18), width: 26, height: 8),
      capPaint,
    );
    // Tassel
    final tasselPaint = Paint()
      ..color = const Color(0xFFFFCC33)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(cx + 14, cy - 14), Offset(cx + 14, cy - 4), tasselPaint);

    // Eyes (glasses frames)
    final glassesPaint = Paint()
      ..color = const Color(0xFF333333)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(cx - 8, cy + 2), 7, glassesPaint);
    canvas.drawCircle(Offset(cx + 8, cy + 2), 7, glassesPaint);
    canvas.drawLine(Offset(cx - 1, cy + 2), Offset(cx + 1, cy + 2), glassesPaint);

    // Pupils
    final pupilPaint = Paint()..color = const Color(0xFF222222);
    canvas.drawCircle(Offset(cx - 8, cy + 2), 3, pupilPaint);
    canvas.drawCircle(Offset(cx + 8, cy + 2), 3, pupilPaint);

    // Nose
    final nosePaint = Paint()..color = const Color(0xFFB06040);
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx, cy + 10), width: 8, height: 5),
      nosePaint,
    );

    // Book (bottom)
    final bookPaint = Paint()..color = const Color(0xFF1A5ABF);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(cx, cy + 24), width: 28, height: 18),
        const Radius.circular(2),
      ),
      bookPaint,
    );
    final spinePaint = Paint()..color = const Color(0xFF0D3A8A);
    canvas.drawRect(
      Rect.fromCenter(center: Offset(cx, cy + 24), width: 2, height: 18),
      spinePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─── Materia Card ─────────────────────────────────────────────────────────────

class MateriaCard extends StatefulWidget {
  final Materia materia;
  final Duration animationDelay;

  const MateriaCard({
    super.key,
    required this.materia,
    required this.animationDelay,
  });

  @override
  State<MateriaCard> createState() => _MateriaCardState();
}

class _MateriaCardState extends State<MateriaCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  bool _pressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(widget.animationDelay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = widget.materia;
    final pct = (m.progresso * 100).toInt();

    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onTapDown: (_) => setState(() => _pressed = true),
            onTapUp: (_) => setState(() => _pressed = false),
            onTapCancel: () => setState(() => _pressed = false),
            onTap: () {
              // Navigate to lesson detail (placeholder)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Abrindo ${m.nome}...'),
                  backgroundColor: m.cor,
                  duration: const Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
            child: AnimatedScale(
              scale: _pressed ? 0.97 : 1.0,
              duration: const Duration(milliseconds: 100),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF132245),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFF1E3260),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Icon
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: m.iconeBg,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(m.icone, color: Colors.white, size: 30),
                    ),

                    const SizedBox(width: 14),

                    // Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                m.nome,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '${m.totalAulas} aulas',
                                style: const TextStyle(
                                  color: Color(0xFFB0C4DE),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Progress bar
                          _AnimatedProgressBar(
                            value: m.progresso,
                            color: m.cor,
                            delay: widget.animationDelay +
                                const Duration(milliseconds: 200),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '$pct% concluído',
                            style: TextStyle(
                              color: m.cor,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    // Chevron
                    Icon(
                      Icons.chevron_right_rounded,
                      color: m.cor,
                      size: 26,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Animated Progress Bar ────────────────────────────────────────────────────

class _AnimatedProgressBar extends StatefulWidget {
  final double value;
  final Color color;
  final Duration delay;

  const _AnimatedProgressBar({
    required this.value,
    required this.color,
    required this.delay,
  });

  @override
  State<_AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<_AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _anim = Tween<double>(begin: 0, end: widget.value).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
    Future.delayed(widget.delay, () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) => ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: LinearProgressIndicator(
          value: _anim.value,
          minHeight: 7,
          backgroundColor: const Color(0xFF1E3260),
          valueColor: AlwaysStoppedAnimation<Color>(widget.color),
        ),
      ),
    );
  }
}

// ─── Nav Item Helper ──────────────────────────────────────────────────────────

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}