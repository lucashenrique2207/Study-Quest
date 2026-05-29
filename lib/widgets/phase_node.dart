import 'package:flutter/material.dart';
import '../models/phase.dart';

class PhaseNode extends StatefulWidget {
  final Phase phase;
  final double size;
  final VoidCallback onTap;

  const PhaseNode({
    super.key,
    required this.phase,
    required this.size,
    required this.onTap,
  });

  @override
  State<PhaseNode> createState() => _PhaseNodeState();
}

class _PhaseNodeState extends State<PhaseNode>
    with SingleTickerProviderStateMixin {
  late AnimationController _tapController;
  bool _pressed = false;

  @override
  void initState() {
    super.initState();
    _tapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _tapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phase = widget.phase;
    final isLocked = !phase.isUnlocked;
    final isCompleted = phase.isCompleted;
    final size = widget.size;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.9 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: SizedBox(
          width: size,
          height: size + 30, // extra space for label + stars
          child: Column(
            children: [
              // Main circle button
              _buildCircle(phase, isLocked, isCompleted, size),

              const SizedBox(height: 4),

              // Phase subtitle
              SizedBox(
                width: size + 20,
                child: Text(
                  phase.subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isLocked ? Colors.white30 : Colors.white70,
                    fontSize: 9,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircle(Phase phase, bool isLocked, bool isCompleted, double size) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer glow ring (for completed or unlocked)
        if (!isLocked)
          Container(
            width: size + 8,
            height: size + 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: isCompleted
                    ? const Color(0xFFFFD700).withOpacity(0.5)
                    : Colors.white.withOpacity(0.2),
                width: 2,
              ),
            ),
          ),

        // Main circle
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isLocked
                ? const LinearGradient(
                    colors: [Color(0xFF2A2A3A), Color(0xFF1A1A2A)],
                  )
                : isCompleted
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          phase.phaseColor.withOpacity(0.9),
                          phase.phaseColor,
                        ],
                      )
                    : LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          phase.phaseColor.withOpacity(0.7),
                          phase.phaseColor.withOpacity(0.5),
                        ],
                      ),
            boxShadow: isLocked
                ? []
                : [
                    BoxShadow(
                      color: phase.phaseColor.withOpacity(isCompleted ? 0.6 : 0.3),
                      blurRadius: isCompleted ? 20 : 10,
                      spreadRadius: isCompleted ? 3 : 0,
                    ),
                  ],
            border: Border.all(
              color: isLocked
                  ? Colors.white12
                  : isCompleted
                      ? const Color(0xFFFFD700).withOpacity(0.8)
                      : Colors.white30,
              width: isCompleted ? 2.5 : 1.5,
            ),
          ),
          child: Center(
            child: isLocked
                ? const Icon(Icons.lock, color: Colors.white30, size: 26)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        phase.emoji,
                        style: TextStyle(fontSize: size * 0.28),
                      ),
                      Text(
                        '${phase.id}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size * 0.18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
          ),
        ),

        // Stars row (bottom of circle)
        if (isCompleted)
          Positioned(
            bottom: 0,
            child: _buildStars(phase.starsEarned),
          ),
      ],
    );
  }

  Widget _buildStars(int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0E27).withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFFD700).withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(3, (i) {
          return Icon(
            i < count ? Icons.star : Icons.star_border,
            color: i < count ? const Color(0xFFFFD700) : Colors.white24,
            size: 11,
          );
        }),
      ),
    );
  }
}
