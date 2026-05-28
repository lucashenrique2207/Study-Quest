import 'package:flutter/material.dart';
import 'package:studyquest/Widgets/bear_painter.dart';

/// Avatar circular do ursinho mascote.
///
/// Tamanho padrão: 70×70. Altere [size] conforme necessário.
class BearAvatar extends StatelessWidget {
  final double size;

  const BearAvatar({super.key, this.size = 70});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        child: CustomPaint(
          painter: BearPainter(),
          size: Size(size, size),
        ),
      ),
    );
  }
}
