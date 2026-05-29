import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'phase.dart';
import '../data/questions_database.dart';

class GameState extends ChangeNotifier {
  List<Phase> _phases = [];
  int _totalStars = 0;

  List<Phase> get phases => _phases;
  int get totalStars => _totalStars;

  static const List<Map<String, dynamic>> _phaseInfo = [
    {'title': 'Fase 1', 'subtitle': 'Primeira Guerra\nMundial', 'emoji': '⚔️', 'color': 0xFFE53935},
    {'title': 'Fase 2', 'subtitle': 'Segunda Guerra\nMundial', 'emoji': '💣', 'color': 0xFFB71C1C},
    {'title': 'Fase 3', 'subtitle': 'Revolução\nFrancesa', 'emoji': '🗽', 'color': 0xFF1565C0},
    {'title': 'Fase 4', 'subtitle': 'Revolução\nIndustrial', 'emoji': '⚙️', 'color': 0xFF37474F},
    {'title': 'Fase 5', 'subtitle': 'Brasil\nColônia', 'emoji': '🌿', 'color': 0xFF2E7D32},
    {'title': 'Fase 6', 'subtitle': 'Ditadura\nMilitar', 'emoji': '🪖', 'color': 0xFF4E342E},
    {'title': 'Fase 7', 'subtitle': 'Guerra\nFria', 'emoji': '☢️', 'color': 0xFF1A237E},
    {'title': 'Fase 8', 'subtitle': 'Independência\ndo Brasil', 'emoji': '🇧🇷', 'color': 0xFF1B5E20},
    {'title': 'Fase 9', 'subtitle': 'Idade\nMédia', 'emoji': '🏰', 'color': 0xFF4A148C},
    {'title': 'Fase 10', 'subtitle': 'Roma\nAntiga', 'emoji': '🏛️', 'color': 0xFFBF360C},
  ];

  void _initPhases() {
    _phases = List.generate(10, (i) {
      final info = _phaseInfo[i];
      return Phase(
        id: i + 1,
        title: info['title'] as String,
        subtitle: info['subtitle'] as String,
        emoji: info['emoji'] as String,
        questions: QuestionsDatabase.allPhases[i],
        phaseColor: Color(info['color'] as int),
        isUnlocked: i == 0,
      );
    });
  }

  Future<void> loadProgress() async {
    _initPhases();
    final prefs = await SharedPreferences.getInstance();

    for (int i = 0; i < _phases.length; i++) {
      final stars = prefs.getInt('phase_${i}_stars') ?? 0;
      final best = prefs.getInt('phase_${i}_best') ?? 0;
      final unlocked = prefs.getBool('phase_${i}_unlocked') ?? (i == 0);

      _phases[i].starsEarned = stars;
      _phases[i].bestScore = best;
      _phases[i].isUnlocked = unlocked;
    }

    _recalcStars();
    notifyListeners();
  }

  Future<void> savePhaseResult(int phaseIndex, int score, int total) async {
    final prefs = await SharedPreferences.getInstance();
    final phase = _phases[phaseIndex];

    final percentage = (score / total) * 100;
    final stars = _calcStars(score, total);

    if (score > phase.bestScore) {
      phase.bestScore = score;
      phase.starsEarned = stars;
      await prefs.setInt('phase_${phaseIndex}_best', score);
      await prefs.setInt('phase_${phaseIndex}_stars', stars);
    }

    // Unlock next phase if >= 70%
    if (percentage >= 70 && phaseIndex + 1 < _phases.length) {
      if (!_phases[phaseIndex + 1].isUnlocked) {
        _phases[phaseIndex + 1].isUnlocked = true;
        await prefs.setBool('phase_${phaseIndex + 1}_unlocked', true);
      }
    }

    _recalcStars();
    notifyListeners();
  }

  int _calcStars(int score, int total) {
    final pct = (score / total) * 100;
    if (pct >= 90) return 3;
    if (pct >= 70) return 2;
    if (pct >= 50) return 1;
    return 0;
  }

  void _recalcStars() {
    _totalStars = _phases.fold(0, (sum, p) => sum + p.starsEarned);
  }

  Future<void> resetProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    loadProgress();
  }
}
