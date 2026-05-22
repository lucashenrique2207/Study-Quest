import 'package:flutter/material.dart';

class BackgroundOrb extends StatelessWidget {
  final double size;
  final Color color;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;

  const BackgroundOrb({
    super.key,
    required this.size,
    required this.color,
    this.top,
    this.left,
    this.bottom,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
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
}
