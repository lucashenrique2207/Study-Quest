import 'package:flutter/material.dart';
import '../app_colors.dart';

/// Card destacado "Aulas" — fundo azul com estrela e label.
///
/// Parâmetro [onTap]: callback opcional ao tocar no card.
class AulasCard extends StatelessWidget {
  final VoidCallback? onTap;

  const AulasCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('⭐', style: TextStyle(fontSize: 28)),
            SizedBox(height: 6),
            Text(
              'Aulas',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
