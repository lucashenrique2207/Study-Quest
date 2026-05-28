import 'package:flutter/material.dart';
import '../app_colors.dart';
import 'aulas_card.dart';
import 'stat_card.dart';

/// Linha horizontal com os cards: Aulas | Pontos | Dias consecutivos.
///
/// Parâmetros:
/// - [pontos]          : valor de pontos do usuário
/// - [diasConsecutivos]: dias seguidos de estudo
/// - [onAulasTap]      : callback ao tocar em Aulas
class StatsRow extends StatelessWidget {
  final int pontos;
  final int diasConsecutivos;
  final VoidCallback? onAulasTap;

  const StatsRow({
    super.key,
    required this.pontos,
    required this.diasConsecutivos,
    this.onAulasTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AulasCard(onTap: onAulasTap)),
        const SizedBox(width: 10),
        Expanded(
          child: StatCard(
            icon: Icons.diamond,
            iconColor: AppColors.iconBlue,
            label: 'Pontos',
            value: pontos.toString(),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatCard(
            icon: Icons.calendar_today,
            iconColor: AppColors.iconBlue,
            label: 'Dias\nconsecutivos',
            value: diasConsecutivos.toString(),
          ),
        ),
      ],
    );
  }
}
