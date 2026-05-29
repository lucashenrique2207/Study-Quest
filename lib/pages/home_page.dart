import 'package:flutter/material.dart';
import 'package:studyquest/Widgets/app_colors.dart';
import 'package:studyquest/Widgets/progress_card.dart';
import 'package:studyquest/Widgets/stats_row.dart';
import 'package:studyquest/Widgets/welcome_banner.dart';

/// Página principal do app de estudos.
///
/// Uso mínimo:
/// ```dart
/// HomePage(
///   pontos: 0,
///   diasConsecutivos: 0,
///   progresso: 0.0,
/// )
/// ```
class HomePageP extends StatelessWidget {
  final int pontos;
  final int diasConsecutivos;
  final double progresso; // 0.0 – 1.0
  final String greeting;
  final String subtitle;
  final VoidCallback? onAulasTap;
  final VoidCallback? onProgressTap;

  const HomePageP({
    super.key,
    this.pontos = 0,
    this.diasConsecutivos = 0,
    this.progresso = 0.0,
    this.greeting = 'Olá!',
    this.subtitle = 'Bem-vindo de volta',
    this.onAulasTap,
    this.onProgressTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeBanner(
                greeting: greeting,
                subtitle: subtitle,
              ),
              const SizedBox(height: 20),

              StatsRow(
                pontos: pontos,
                diasConsecutivos: diasConsecutivos,
                onAulasTap: onAulasTap,
              ),
              const SizedBox(height: 20),

              ProgressCard(
                value: progresso,
                onTap: onProgressTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
