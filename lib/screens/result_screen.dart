import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import 'map_screen.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatefulWidget {
  final int phaseIndex;
  final int score;
  final int total;

  const ResultScreen({
    super.key,
    required this.phaseIndex,
    required this.score,
    required this.total,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with TickerProviderStateMixin {
  late AnimationController _entryController;
  late AnimationController _starsController;
  late AnimationController _particleController;

  late Animation<double> _entryAnim;
  late Animation<double> _starsAnim;

  int _displayedScore = 0;

  @override
  void initState() {
    super.initState();

    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _starsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _entryAnim = CurvedAnimation(
      parent: _entryController,
      curve: Curves.elasticOut,
    );
    _starsAnim = CurvedAnimation(
      parent: _starsController,
      curve: Curves.bounceOut,
    );

    _entryController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      _starsController.forward();
      _animateScore();
    });

    if (_stars > 0) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _particleController.repeat();
      });
    }
  }

  @override
  void dispose() {
    _entryController.dispose();
    _starsController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  void _animateScore() {
    const steps = 20;
    final stepValue = widget.score / steps;
    for (int i = 1; i <= steps; i++) {
      Future.delayed(Duration(milliseconds: i * 40), () {
        if (mounted) {
          setState(() => _displayedScore = (stepValue * i).round().clamp(0, widget.score));
        }
      });
    }
  }

  int get _stars {
    final pct = (widget.score / widget.total) * 100;
    if (pct >= 90) return 3;
    if (pct >= 70) return 2;
    if (pct >= 50) return 1;
    return 0;
  }

  bool get _passed => _stars >= 2; // >= 70%

  @override
  Widget build(BuildContext context) {
    final gameState = context.watch<GameState>();
    final phase = gameState.phases[widget.phaseIndex];
    final pct = (widget.score / widget.total * 100).round();
    final hasNext = widget.phaseIndex + 1 < gameState.phases.length;
    final nextUnlocked = hasNext && gameState.phases[widget.phaseIndex + 1].isUnlocked;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _passed
                ? [const Color(0xFF0A1A28), const Color(0xFF0D2044), const Color(0xFF0A1628)]
                : [const Color(0xFF1A0A0A), const Color(0xFF2A1010), const Color(0xFF1A0A0A)],
          ),
        ),
        child: Stack(
          children: [
            // Particles for victory
            if (_passed) _buildParticles(),

            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Main card
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _entryAnim,
                      builder: (_, child) => Transform.scale(
                        scale: _entryAnim.value,
                        child: child,
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            // Trophy / fail emoji
                            Text(
                              _passed ? '🏆' : '💔',
                              style: const TextStyle(fontSize: 80),
                            ),

                            const SizedBox(height: 16),

                            Text(
                              _passed ? 'Parabéns!' : 'Tente Novamente',
                              style: TextStyle(
                                color: _passed ? const Color(0xFFFFD700) : Colors.redAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              phase.subtitle.replaceAll('\n', ' '),
                              style: const TextStyle(
                                color: Colors.white60,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Stars
                            AnimatedBuilder(
                              animation: _starsAnim,
                              builder: (_, __) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(3, (i) {
                                  final delay = i * 0.2;
                                  final animVal = ((_starsAnim.value - delay) / 0.6)
                                      .clamp(0.0, 1.0);
                                  return Transform.scale(
                                    scale: i < _stars
                                        ? 1.0 + (animVal * 0.3)
                                        : 0.8,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      child: Icon(
                                        i < _stars ? Icons.star : Icons.star_border,
                                        color: i < _stars
                                            ? const Color(0xFFFFD700)
                                            : Colors.white24,
                                        size: 52,
                                        shadows: i < _stars
                                            ? [
                                                const Shadow(
                                                  color: Color(0xFFFFD700),
                                                  blurRadius: 20,
                                                ),
                                              ]
                                            : null,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Score card
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.07),
                                border: Border.all(color: Colors.white.withOpacity(0.12)),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _resultStat('$_displayedScore/${widget.total}', 'Acertos', '✅'),
                                      Container(width: 1, height: 40, color: Colors.white12),
                                      _resultStat('$pct%', 'Pontuação', '📊'),
                                      Container(width: 1, height: 40, color: Colors.white12),
                                      _resultStat('$_stars/3', 'Estrelas', '⭐'),
                                    ],
                                  ),

                                  const SizedBox(height: 16),

                                  // Progress bar
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: LinearProgressIndicator(
                                      value: widget.score / widget.total,
                                      minHeight: 8,
                                      backgroundColor: Colors.white12,
                                      valueColor: AlwaysStoppedAnimation(
                                        _passed ? const Color(0xFFFFD700) : Colors.redAccent,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Text(
                                    _passed
                                        ? _stars == 3
                                            ? '🌟 Desempenho perfeito!'
                                            : '🎉 Fase desbloqueada!'
                                        : '😞 Precisa de 70% para avançar',
                                    style: TextStyle(
                                      color: _passed ? Colors.greenAccent : Colors.orange,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 32),

                            // Buttons
                            _buildButtons(context, hasNext, nextUnlocked),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _resultStat(String value, String label, String icon) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(label, style: const TextStyle(color: Colors.white38, fontSize: 11)),
      ],
    );
  }

  Widget _buildButtons(BuildContext context, bool hasNext, bool nextUnlocked) {
    return Column(
      children: [
        // Retry button
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => QuizScreen(phaseIndex: widget.phaseIndex),
              ),
            );
          },
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: Colors.white30),
              color: Colors.white.withOpacity(0.08),
            ),
            child: const Center(
              child: Text(
                '🔄  TENTAR NOVAMENTE',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Next phase or map button
        GestureDetector(
          onTap: () {
            if (_passed && hasNext && nextUnlocked) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => QuizScreen(phaseIndex: widget.phaseIndex + 1),
                ),
              );
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MapScreen()),
                (route) => route.isFirst,
              );
            }
          },
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              gradient: const LinearGradient(
                colors: [Color(0xFFFFD700), Color(0xFFFFA000)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFD700).withOpacity(0.4),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                _passed && hasNext && nextUnlocked
                    ? '➡️  PRÓXIMA FASE'
                    : '🗺️  VOLTAR AO MAPA',
                style: const TextStyle(
                  color: Color(0xFF0A0E27),
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildParticles() {
    return AnimatedBuilder(
      animation: _particleController,
      builder: (_, __) {
        return CustomPaint(
          painter: _ParticlePainter(_particleController.value),
          child: Container(),
        );
      },
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final double progress;
  static final Random _rng = Random(42);

  _ParticlePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final colors = [
      const Color(0xFFFFD700),
      const Color(0xFF4CAF50),
      const Color(0xFF2196F3),
      const Color(0xFFE91E63),
    ];

    for (int i = 0; i < 30; i++) {
      final baseX = _rng.nextDouble() * size.width;
      final speed = 0.3 + _rng.nextDouble() * 0.7;
      final phase = _rng.nextDouble();
      final t = (progress * speed + phase) % 1.0;

      final x = baseX + sin(t * pi * 2 + i) * 20;
      final y = size.height * (1.0 - t);

      final paint = Paint()
        ..color = colors[i % colors.length].withOpacity(1.0 - t)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(x, y), 4, paint);
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter old) => old.progress != progress;
}
