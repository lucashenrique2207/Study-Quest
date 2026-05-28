import 'package:flutter/material.dart';
import 'package:studyquest/Widgets/app_colors.dart';
import 'bear_avatar.dart';

/// Banner azul de boas-vindas exibido no topo da HomePage.
///
/// Parâmetros:
/// - [greeting]  : texto principal (padrão "Olá!")
/// - [subtitle]  : texto secundário (padrão "Bem-vindo de volta")
class WelcomeBanner extends StatelessWidget {
  final String greeting;
  final String subtitle;

  const WelcomeBanner({
    super.key,
    this.greeting = 'Olá!',
    this.subtitle = 'Bem-vindo de volta',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const BearAvatar(size: 70),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const Spacer(),
          Opacity(
            opacity: 0.2,
            child: Icon(
              Icons.dialpad_rounded,
              color: Colors.white,
              size: 60,
            ),
          ),
        ],
      ),
    );
  }
}
