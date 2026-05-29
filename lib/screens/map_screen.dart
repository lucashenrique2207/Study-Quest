import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../models/phase.dart';
import '../widgets/phase_node.dart';
import '../widgets/path_painter.dart';
import 'quiz_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animController.dispose();
    super.dispose();
  }

  // Positions for nodes matching zigzag pattern in image
  // Layout: alternating left/center-right columns, flowing downward
  static const double _nodeSize = 80.0;
  static const double _canvasWidth = 360.0;

  List<Offset> _getNodePositions(double canvasWidth) {
    // Positions designed to match the image zigzag pattern
    // The pattern alternates: right, center-left, right, left, center...
    final w = canvasWidth;
    const nodePositions = [
      // Phase 1 - right side
      Offset(0.72, 0.05),
      // Phase 2 - left side
      Offset(0.20, 0.14),
      // Phase 3 - center-right
      Offset(0.62, 0.24),
      // Phase 4 - left
      Offset(0.15, 0.34),
      // Phase 5 - center
      Offset(0.55, 0.44),
      // Phase 6 - left-center
      Offset(0.18, 0.54),
      // Phase 7 - right
      Offset(0.65, 0.63),
      // Phase 8 - left
      Offset(0.12, 0.73),
      // Phase 9 - center-right
      Offset(0.60, 0.82),
      // Phase 10 - center
      Offset(0.25, 0.91),
    ];

    return nodePositions
        .map((p) => Offset(p.dx * w, p.dy * 1100))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final phases = gameState.phases;
    final screenWidth = MediaQuery.of(context).size.width;

    final positions = _getNodePositions(screenWidth);
    const totalHeight = 1200.0;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A1628),
              Color(0xFF0D2044),
              Color(0xFF111B3A),
              Color(0xFF0A1628),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Decorative background stars
            ..._buildStarDecorations(),

            // Main content
            Column(
              children: [
                // AppBar area
                SafeArea(
                  bottom: false,
                  child: _buildTopBar(context, gameState),
                ),

                // Scrollable map
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      width: double.infinity,
                      height: totalHeight,
                      child: Stack(
                        children: [
                          // Path connections
                          Positioned.fill(
                            child: CustomPaint(
                              painter: PathPainter(
                                positions: positions,
                                nodeSize: _nodeSize,
                                phases: phases,
                              ),
                            ),
                          ),

                          // Phase nodes
                          ...List.generate(phases.length, (i) {
                            final pos = positions[i];
                            return Positioned(
                              left: pos.dx - _nodeSize / 2,
                              top: pos.dy - _nodeSize / 2,
                              child: AnimatedBuilder(
                                animation: _animController,
                                builder: (_, __) {
                                  final delay = i * 0.08;
                                  final animValue = Curves.elasticOut.transform(
                                    ((_animController.value - delay) / (1 - delay))
                                        .clamp(0.0, 1.0),
                                  );
                                  return Transform.scale(
                                    scale: animValue,
                                    child: PhaseNode(
                                      phase: phases[i],
                                      size: _nodeSize,
                                      onTap: () => _onPhaseTap(context, i, phases[i]),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, GameState gameState) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  color: Colors.white, size: 18),
            ),
          ),

          const SizedBox(width: 12),

          // Title
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MAPA DE FASES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  'História do Mundo',
                  style: TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ],
            ),
          ),

          // Stars counter
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFD700), Color(0xFFFFA000)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFD700).withOpacity(0.4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: Color(0xFF0A0E27), size: 16),
                const SizedBox(width: 4),
                Text(
                  '${gameState.totalStars}',
                  style: const TextStyle(
                    color: Color(0xFF0A0E27),
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          // Bear mascot
          const SizedBox(width: 10),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.08),
              border: Border.all(color: Colors.white24, width: 1.5),
            ),
            child: const Center(
              child: Text('🐻', style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
    );
  }

  void _onPhaseTap(BuildContext context, int index, Phase phase) {
    if (!phase.isUnlocked) {
      _showLockedDialog(context, phase);
      return;
    }

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => QuizScreen(phaseIndex: index),
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (_, anim, __, child) => FadeTransition(
          opacity: anim,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.9, end: 1.0).animate(anim),
            child: child,
          ),
        ),
      ),
    );
  }

  void _showLockedDialog(BuildContext context, Phase phase) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1A3A6B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🔒', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 12),
            Text(
              phase.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Complete a fase anterior com pelo menos 70% de acertos para desbloquear!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white60, fontSize: 13),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok!', style: TextStyle(color: Color(0xFFFFD700))),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildStarDecorations() {
    return [
      Positioned(
        top: 80, left: 30,
        child: _starDot(3),
      ),
      Positioned(
        top: 200, right: 50,
        child: _starDot(2),
      ),
      Positioned(
        top: 400, left: 60,
        child: _starDot(4),
      ),
      Positioned(
        top: 600, right: 30,
        child: _starDot(2),
      ),
    ];
  }

  Widget _starDot(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white38,
      ),
    );
  }
}
