import 'package:flutter/material.dart';

/// Desenha o ursinho mascote via [CustomPainter].
/// Usado dentro de [BearAvatar].
class BearPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    // Fundo azul claro do círculo
    canvas.drawCircle(
      Offset(cx, cy),
      size.width / 2,
      Paint()..color = const Color(0xFF7EA8F8),
    );

    final brownPaint = Paint()..color = const Color(0xFFCC8844);

    // Cabeça
    canvas.drawCircle(Offset(cx, cy - 4), 20, brownPaint);

    // Orelhas externas
    canvas.drawCircle(Offset(cx - 14, cy - 20), 8, brownPaint);
    canvas.drawCircle(Offset(cx + 14, cy - 20), 8, brownPaint);

    // Centro das orelhas (mais claro)
    final lightBrown = Paint()..color = const Color(0xFFEEAA66);
    canvas.drawCircle(Offset(cx - 14, cy - 20), 5, lightBrown);
    canvas.drawCircle(Offset(cx + 14, cy - 20), 5, lightBrown);

    // Focinho
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx, cy + 2), width: 16, height: 12),
      lightBrown,
    );

    // Óculos – armação
    final glassPaint = Paint()
      ..color = const Color(0xFF333344)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(Offset(cx - 7, cy - 6), 5.5, glassPaint);
    canvas.drawCircle(Offset(cx + 7, cy - 6), 5.5, glassPaint);
    canvas.drawLine(Offset(cx - 1.5, cy - 6), Offset(cx + 1.5, cy - 6), glassPaint);

    // Pupilas
    final eyePaint = Paint()..color = const Color(0xFF111122);
    canvas.drawCircle(Offset(cx - 7, cy - 6), 2.5, eyePaint);
    canvas.drawCircle(Offset(cx + 7, cy - 6), 2.5, eyePaint);

    // Nariz
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx, cy + 1), width: 5, height: 3.5),
      eyePaint,
    );

    // Bochechas rosadas
    canvas.drawCircle(Offset(cx - 12, cy + 3), 4,
        Paint()..color = const Color(0xFFFF9999).withOpacity(0.5));
    canvas.drawCircle(Offset(cx + 12, cy + 3), 4,
        Paint()..color = const Color(0xFFFF9999).withOpacity(0.5));

    // Chapéu de formatura
    final hatPaint = Paint()..color = const Color(0xFF2244AA);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(cx, cy - 21), width: 32, height: 5),
        const Radius.circular(2),
      ),
      hatPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(cx, cy - 27), width: 24, height: 12),
        const Radius.circular(3),
      ),
      hatPaint,
    );
    // Cordão do chapéu
    canvas.drawLine(
      Offset(cx + 12, cy - 21),
      Offset(cx + 15, cy - 16),
      Paint()
        ..color = const Color(0xFFFFDD00)
        ..strokeWidth = 1.5,
    );

    // Livro
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(cx, cy + 18), width: 30, height: 18),
        const Radius.circular(3),
      ),
      Paint()..color = const Color(0xFF2255DD),
    );
    // Lombada do livro
    canvas.drawLine(
      Offset(cx, cy + 9),
      Offset(cx, cy + 27),
      Paint()
        ..color = const Color(0xFF99BBFF)
        ..strokeWidth = 1,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
