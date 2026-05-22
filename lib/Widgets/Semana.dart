import 'package:flutter/material.dart';

class WeeklyRewardWidget extends StatefulWidget {
  final List<String> weekDays;
  final List<String> chestReward;
  final int initialTodayIdx;

  const WeeklyRewardWidget({
    super.key,
    required this.weekDays,
    required this.chestReward,
    required this.initialTodayIdx,
  });

  @override
  State<WeeklyRewardWidget> createState() => _WeeklyRewardWidgetState();
}

class _WeeklyRewardWidgetState extends State<WeeklyRewardWidget> {
  late int todayIdx;

  @override
  void initState() {
    super.initState();
    todayIdx = widget.initialTodayIdx;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2E), // Fundo escuro moderno
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Recompensas Diárias',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Linha horizontal com os dias
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(widget.weekDays.length, (index) {
                final isToday = index == todayIdx;
                final isPast = index < todayIdx;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    width: 65,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: isToday 
                          ? Colors.amber.withOpacity(0.15) 
                          : Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isToday 
                            ? Colors.amber 
                            : Colors.white.withOpacity(0.1),
                        width: isToday ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Nome do dia
                        Text(
                          widget.weekDays[index],
                          style: TextStyle(
                            color: isToday ? Colors.amber : Colors.grey,
                            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Ícone do Baú / Status
                        Text(
                          widget.chestReward[index],
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 8),
                        // Indicador visual inferior
                        if (isPast)
                          const Icon(Icons.check_circle, color: Colors.green, size: 16)
                        else if (isToday)
                          const Text(
                            'HOJE',
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        else
                          Icon(Icons.lock_outline, color: Colors.white.withOpacity(0.3), size: 14),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}