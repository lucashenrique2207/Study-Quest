import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const QuestsApp());
}

class QuestsApp extends StatelessWidget {
  const QuestsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Quest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const StudyQuestHome(),
    );
  }
}

// ─── Data ───────────────────────────────────────────────────────────────────

class Phase {
  final int number;
  final String title;
  final PhaseStatus status;
  final int stars; // 0-3

  const Phase({
    required this.number,
    required this.title,
    required this.status,
    this.stars = 0,
  });
}

enum PhaseStatus { completed, current, locked }

final List<Phase> phases = [
  Phase(number: 1, title: 'Ditadura\nMilitar',      status: PhaseStatus.completed, stars: 3),
  Phase(number: 2, title: 'Era\nVargas',            status: PhaseStatus.current),
  Phase(number: 3, title: 'Segunda\nGuerra Mundial',status: PhaseStatus.locked),
  Phase(number: 4, title: 'Primeira\nGuerra Mundial',status: PhaseStatus.locked),
  Phase(number: 5, title: 'Brasil\nColônia',        status: PhaseStatus.locked),
  Phase(number: 6, title: 'Independência\ndo Brasil',status: PhaseStatus.locked),
  Phase(number: 7, title: 'Revolução\nFrancesa',    status: PhaseStatus.locked),
  Phase(number: 8, title: 'Roma\nAntiga',           status: PhaseStatus.locked),
  Phase(number: 9, title: 'Egito\nAntigo',          status: PhaseStatus.locked),
  Phase(number: 10,title: 'Guerra\nFria',           status: PhaseStatus.locked),
];

// ─── Layout positions (fraction of container width) ─────────────────────────
// Each row has 1-3 nodes. Values are (left-offset fraction, row index).
// Row height = 120 logical px.
const List<Map<String, double>> phasePositions = [
  {'col': 0.08},  // 1 – left
  {'col': 0.55},  // 2 – right
  {'col': 0.08},  // 3 – left
  {'col': 0.52},  // 4 – center-right
  {'col': 0.05},  // 5 – left
  {'col': 0.38},  // 6 – center
  {'col': 0.68},  // 7 – right
  {'col': 0.05},  // 8 – left
  {'col': 0.40},  // 9 – center
  {'col': 0.68},  // 10 – right (finish)
];

// ─── Colors ─────────────────────────────────────────────────────────────────
const Color kBgTop    = Color(0xFF0A2472);
const Color kBgBot    = Color(0xFF0D47A1);
const Color kNodeLocked   = Color(0xFF1565C0);
const Color kNodeCurrent  = Color(0xFF1976D2);
const Color kNodeCompleted= Color(0xFF1B5E20);
const Color kNodeGlow     = Color(0xFF42A5F5);
const Color kGoldStar     = Color(0xFFFFC107);
const Color kAccent       = Color(0xFF64B5F6);
const Color kBottomBar    = Color(0xFFFFFFFF);

// ─── Main Screen ─────────────────────────────────────────────────────────────

class StudyQuestHome extends StatefulWidget {
  const StudyQuestHome({super.key});
  @override
  State<StudyQuestHome> createState() => _StudyQuestHomeState();
}

class _StudyQuestHomeState extends State<StudyQuestHome>
    with TickerProviderStateMixin {
  int _selectedTab = 0;
  late AnimationController _pulseCtrl;
  late Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
    _pulse = Tween<double>(begin: 1.0, end: 1.12).animate(
      CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgTop,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [kBgTop, Color(0xFF1565C0), kBgBot],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
                child: Column(
                  children: [
                    _buildHeader(),
                    _buildStatsBar(),
                    Expanded(child: _buildMapArea()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Header ────────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 16, 0),
      child: Row(
        children: [
          const Text(
            'Study Quest',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          const Spacer(),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: kNodeGlow.withOpacity(0.5),
                  blurRadius: 16,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipOval(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: _BearMascot(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Stats Bar ─────────────────────────────────────────────────────────────
  Widget _buildStatsBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.10),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.18)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _statItem('⭐', '1500', 'pontos'),
            _divider(),
            _statItem('🔥', '10 dias', 'sequência'),
            _divider(),
            _statItem('🕐', '4h', 'tempo'),
          ],
        ),
      ),
    );
  }

  Widget _statItem(String icon, String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(icon, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 6),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.white.withOpacity(0.65),
          ),
        ),
      ],
    );
  }

  Widget _divider() => Container(
        width: 1,
        height: 36,
        color: Colors.white.withOpacity(0.2),
      );

  // ── Map Area ──────────────────────────────────────────────────────────────
  Widget _buildMapArea() {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final w = constraints.maxWidth;
        const double rowH = 115.0;
        const double nodeR = 36.0;
        const double topPad = 24.0;

        // Compute absolute positions for each phase node
        final List<Offset> positions = List.generate(phases.length, (i) {
          final col = phasePositions[i]['col']!;
          final row = i.toDouble();
          return Offset(col * w + nodeR, topPad + row * rowH + nodeR);
        });

        final double totalH = topPad + phases.length * rowH + nodeR + 48;

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 16),
          child: SizedBox(
            width: w,
            height: math.max(totalH, constraints.maxHeight),
            child: Stack(
              children: [
                // Dashed path
                Positioned.fill(
                  child: CustomPaint(
                    painter: _DashedPathPainter(positions: positions),
                  ),
                ),
                // Phase nodes
                ...List.generate(phases.length, (i) {
                  final phase = phases[i];
                  final pos = positions[i];
                  final isCurrent = phase.status == PhaseStatus.current;
                  final isLast = i == phases.length - 1;

                  Widget node = _PhaseNode(
                    phase: phase,
                    radius: nodeR,
                    pulse: isCurrent ? _pulse : null,
                  );

                  if (isLast) {
                    node = Stack(
                      clipBehavior: Clip.none,
                      children: [
                        node,
                        Positioned(
                          right: -10,
                          bottom: -6,
                          child: _FlagIcon(),
                        ),
                      ],
                    );
                  }

                  return Positioned(
                    left: pos.dx - nodeR,
                    top: pos.dy - nodeR,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Stars above completed
                        if (phase.stars > 0)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: _StarsRow(stars: phase.stars),
                          )
                        else
                          const SizedBox(height: 16),
                        node,
                        const SizedBox(height: 4),
                        SizedBox(
                          width: nodeR * 2 + 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              phase.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w600,
                                color: phase.status == PhaseStatus.locked
                                    ? Colors.white.withOpacity(0.5)
                                    : Colors.white,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  // ── Bottom Nav ────────────────────────────────────────────────────────────
  Widget _buildBottomNav() {
    const items = [
      _NavItem(icon: Icons.home_rounded, label: 'Home'),
      _NavItem(icon: Icons.star_rounded, label: 'Desafios'),
      _NavItem(icon: Icons.bar_chart_rounded, label: 'Progresso'),
      _NavItem(icon: Icons.emoji_events_rounded, label: 'Conquistas'),
      _NavItem(icon: Icons.person_rounded, label: 'Perfil'),
    ];

    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: kBottomBar,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Color(0x22000000), blurRadius: 16)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final selected = i == _selectedTab;
          return GestureDetector(
            onTap: () => setState(() => _selectedTab = i),
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              width: 64,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    items[i].icon,
                    size: 26,
                    color: selected
                        ? const Color(0xFF1565C0)
                        : const Color(0xFFBBBBBB),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    items[i].label,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                      color: selected
                          ? const Color(0xFF1565C0)
                          : const Color(0xFFBBBBBB),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ─── Phase Node Widget ────────────────────────────────────────────────────────

class _PhaseNode extends StatelessWidget {
  final Phase phase;
  final double radius;
  final Animation<double>? pulse;

  const _PhaseNode({
    required this.phase,
    required this.radius,
    this.pulse,
  });

  @override
  Widget build(BuildContext context) {
    Widget node = _buildCircle();

    if (pulse != null) {
      node = ScaleTransition(scale: pulse!, child: node);
    }

    return node;
  }

  Widget _buildCircle() {
    final locked = phase.status == PhaseStatus.locked;
    final completed = phase.status == PhaseStatus.completed;
    final current = phase.status == PhaseStatus.current;

    Color bgColor;
    Color borderColor;
    Color textColor;
    List<BoxShadow> shadows = [];

    if (completed) {
      bgColor = const Color(0xFF2E7D32);
      borderColor = const Color(0xFF66BB6A);
      textColor = Colors.white;
      shadows = [
        BoxShadow(color: const Color(0xFF66BB6A).withOpacity(0.6), blurRadius: 14, spreadRadius: 1),
      ];
    } else if (current) {
      bgColor = const Color(0xFF1565C0);
      borderColor = const Color(0xFF90CAF9);
      textColor = Colors.white;
      shadows = [
        BoxShadow(color: const Color(0xFF42A5F5).withOpacity(0.7), blurRadius: 18, spreadRadius: 3),
        BoxShadow(color: const Color(0xFF90CAF9).withOpacity(0.4), blurRadius: 32, spreadRadius: 6),
      ];
    } else {
      bgColor = kNodeLocked;
      borderColor = const Color(0xFF42A5F5).withOpacity(0.6);
      textColor = Colors.white.withOpacity(0.55);
    }

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        border: Border.all(color: borderColor, width: locked ? 2 : 3),
        boxShadow: shadows,
      ),
      child: Center(
        child: locked
            ? Icon(Icons.lock_rounded,
                color: Colors.white.withOpacity(0.4), size: radius * 0.8)
            : Text(
                '${phase.number}',
                style: TextStyle(
                  fontSize: radius * 0.72,
                  fontWeight: FontWeight.w800,
                  color: textColor,
                ),
              ),
      ),
    );
  }
}

// ─── Stars Row ────────────────────────────────────────────────────────────────

class _StarsRow extends StatelessWidget {
  final int stars;
  const _StarsRow({required this.stars});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        final filled = i < stars;
        return Icon(
          filled ? Icons.star_rounded : Icons.star_outline_rounded,
          color: filled ? kGoldStar : Colors.white.withOpacity(0.3),
          size: 18,
        );
      }),
    );
  }
}

// ─── Flag Icon ────────────────────────────────────────────────────────────────

class _FlagIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: const Color(0xFF1565C0),
        shape: BoxShape.circle,
        border: Border.all(color: kNodeGlow, width: 2),
      ),
      child: const Icon(Icons.flag_rounded, color: Colors.white, size: 18),
    );
  }
}

// ─── Bear Mascot (drawn with Flutter) ────────────────────────────────────────

class _BearMascot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _BearPainter());
  }
}

class _BearPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final paint = Paint()..isAntiAlias = true;

    // Body
    paint.color = const Color(0xFFE07B39);
    canvas.drawOval(Rect.fromLTWH(w * 0.15, h * 0.35, w * 0.70, h * 0.60), paint);

    // Head
    canvas.drawCircle(Offset(w * 0.50, h * 0.38), w * 0.36, paint);

    // Ears
    canvas.drawCircle(Offset(w * 0.20, h * 0.13), w * 0.14, paint);
    canvas.drawCircle(Offset(w * 0.80, h * 0.13), w * 0.14, paint);

    // Inner ears
    paint.color = const Color(0xFFD2691E);
    canvas.drawCircle(Offset(w * 0.20, h * 0.13), w * 0.08, paint);
    canvas.drawCircle(Offset(w * 0.80, h * 0.13), w * 0.08, paint);

    // Muzzle
    paint.color = const Color(0xFFF5CBA7);
    canvas.drawOval(Rect.fromLTWH(w * 0.32, h * 0.44, w * 0.36, h * 0.22), paint);

    // Nose
    paint.color = const Color(0xFF3E2723);
    canvas.drawOval(Rect.fromLTWH(w * 0.42, h * 0.44, w * 0.16, h * 0.09), paint);

    // Eyes (white)
    paint.color = Colors.white;
    canvas.drawCircle(Offset(w * 0.36, h * 0.33), w * 0.10, paint);
    canvas.drawCircle(Offset(w * 0.64, h * 0.33), w * 0.10, paint);

    // Eyes (pupil)
    paint.color = const Color(0xFF1A1A1A);
    canvas.drawCircle(Offset(w * 0.37, h * 0.34), w * 0.06, paint);
    canvas.drawCircle(Offset(w * 0.65, h * 0.34), w * 0.06, paint);

    // Eye shine
    paint.color = Colors.white;
    canvas.drawCircle(Offset(w * 0.39, h * 0.32), w * 0.025, paint);
    canvas.drawCircle(Offset(w * 0.67, h * 0.32), w * 0.025, paint);

    // Glasses
    paint.color = const Color(0xFF1565C0);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = w * 0.04;
    canvas.drawCircle(Offset(w * 0.36, h * 0.33), w * 0.12, paint);
    canvas.drawCircle(Offset(w * 0.64, h * 0.33), w * 0.12, paint);
    canvas.drawLine(Offset(w * 0.48, h * 0.33), Offset(w * 0.52, h * 0.33), paint);
    canvas.drawLine(Offset(w * 0.10, h * 0.31), Offset(w * 0.24, h * 0.33), paint);
    canvas.drawLine(Offset(w * 0.76, h * 0.33), Offset(w * 0.90, h * 0.31), paint);
    paint.style = PaintingStyle.fill;

    // Graduation cap
    paint.color = const Color(0xFF1565C0);
    final capPath = Path()
      ..moveTo(w * 0.50, h * 0.00)
      ..lineTo(w * 0.10, h * 0.14)
      ..lineTo(w * 0.50, h * 0.20)
      ..lineTo(w * 0.90, h * 0.14)
      ..close();
    canvas.drawPath(capPath, paint);

    final boardPath = Path()
      ..moveTo(w * 0.28, h * 0.08)
      ..lineTo(w * 0.72, h * 0.08)
      ..lineTo(w * 0.72, h * 0.04)
      ..lineTo(w * 0.28, h * 0.04)
      ..close();
    canvas.drawPath(boardPath, paint);

    // Tassel
    paint.color = kGoldStar;
    paint.strokeWidth = w * 0.03;
    paint.style = PaintingStyle.stroke;
    canvas.drawLine(Offset(w * 0.78, h * 0.12), Offset(w * 0.85, h * 0.24), paint);
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(w * 0.86, h * 0.26), w * 0.04, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─── Dashed Path Painter ─────────────────────────────────────────────────────

class _DashedPathPainter extends CustomPainter {
  final List<Offset> positions;
  const _DashedPathPainter({required this.positions});

  @override
  void paint(Canvas canvas, Size size) {
    const nodeR = 36.0;
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.55)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < positions.length - 1; i++) {
      _drawDashedLine(canvas, paint, positions[i], positions[i + 1], nodeR);
    }
  }

  void _drawDashedLine(
      Canvas canvas, Paint paint, Offset from, Offset to, double margin) {
    final dir = (to - from);
    final dist = dir.distance;
    final unit = dir / dist;

    final start = from + unit * (margin + 4);
    final end = to - unit * (margin + 4);

    const dashLen = 10.0;
    const gapLen = 7.0;
    double traveled = 0;
    final total = (end - start).distance;

    while (traveled < total) {
      final a = start + unit * traveled;
      final b = start + unit * math.min(traveled + dashLen, total);
      canvas.drawLine(a, b, paint);
      traveled += dashLen + gapLen;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedPathPainter old) =>
      old.positions != positions;
}

// ─── Nav Item Model ───────────────────────────────────────────────────────────

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}