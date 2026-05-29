import 'package:flutter/material.dart';
import 'question.dart';

class Phase {
  final int id;
  final String title;
  final String subtitle;
  final String emoji;
  final List<Question> questions;
  final Color phaseColor;
  bool isUnlocked;
  int starsEarned;
  int bestScore;

  Phase({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.questions,
    required this.phaseColor,
    this.isUnlocked = false,
    this.starsEarned = 0,
    this.bestScore = 0,
  });

  bool get isCompleted => starsEarned > 0;
  int get totalQuestions => questions.length;
  double get completionPercentage =>
      bestScore > 0 ? (bestScore / totalQuestions) * 100 : 0;
}
