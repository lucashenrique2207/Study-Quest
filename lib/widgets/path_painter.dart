import 'package:flutter/material.dart';
import '../models/phase.dart';

class PathPainter extends CustomPainter {
  final List<Offset> positions;
  final double nodeSize;
  final List<Phase> phases;

  PathPainter({
    required this.positions,
    required this.nodeSize,
    required this.phases,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < positions.length - 1; i++) {
      final from = positions[i];
      final to = positions[i + 1];
      _drawConnection(canvas, from, to, i);
    }
  }

  void _drawConnection(Canvas canvas, Offset from, Offset to, int fromIndex) {
    final isUnlocked = fromIndex < phases.length &&
        phases[fromIndex].isCompleted;

    // Dashed line paint
    final dashedPaint = Paint()
      ..color = isUnlocked
          ? const Color(0xFFFFD700).withOpacity(0.7)
          : Colors.white.withOpacity(0.18)
      ..strokeWidth = isUnlocked ? 3.5 : 2.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Glow paint for completed paths
    if (isUnlocked) {
      final glowPaint = Paint()
        ..color = const Color(0xFFFFD700).withOpacity(0.15)
        ..strokeWidth = 12
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

      _drawCurvedPath(canvas, from, to, glowPaint);
    }

    _drawDashedCurvedPath(canvas, from, to, dashedPaint, isUnlocked);
  }

  void _drawCurvedPath(Canvas canvas, Offset from, Offset to, Paint paint) {
    final path = _buildCurvedPath(from, to);
    canvas.drawPath(path, paint);
  }

  void _drawDashedCurvedPath(
      Canvas canvas, Offset from, Offset to, Paint paint, bool solid) {
    if (solid) {
      final path = _buildCurvedPath(from, to);
      canvas.drawPath(path, paint);
      return;
    }

    // Draw dashed path
    final path = _buildCurvedPath(from, to);
    final metrics = path.computeMetrics().toList();
    for (final metric in metrics) {
      final length = metric.length;
      double distance = 0;
      const dashLen = 12.0;
      const gapLen = 8.0;
      bool drawing = true;

      while (distance < length) {
        final segLen = drawing ? dashLen : gapLen;
        final end = (distance + segLen).clamp(0.0, length);
        if (drawing) {
          canvas.drawPath(
            metric.extractPath(distance, end),
            paint,
          );
        }
        distance = end;
        drawing = !drawing;
      }
    }
  }

  Path _buildCurvedPath(Offset from, Offset to) {
    final path = Path();

    // Start from bottom of 'from' node
    final startX = from.dx;
    final startY = from.dy + nodeSize / 2;

    // End at top of 'to' node
    final endX = to.dx;
    final endY = to.dy - nodeSize / 2;

    path.moveTo(startX, startY);

    // Create a smooth curved bezier path
    final midX = (startX + endX) / 2;
    final midY = (startY + endY) / 2;

    // Curve control points - creates nice S-curve or arc
    final cp1x = startX + (endX - startX) * 0.1;
    final cp1y = startY + (endY - startY) * 0.5;
    final cp2x = endX - (endX - startX) * 0.1;
    final cp2y = endY - (endY - startY) * 0.5;

    path.cubicTo(cp1x, cp1y, cp2x, cp2y, endX, endY);

    return path;
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) {
    return oldDelegate.positions != positions ||
        oldDelegate.phases != phases;
  }
}
