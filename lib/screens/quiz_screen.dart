import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../models/phase.dart';
import '../models/question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final int phaseIndex;

  const QuizScreen({super.key, required this.phaseIndex});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  int _currentQuestion = 0;
  int _score = 0;
  int? _selectedAnswer;
  bool _answered = false;
  bool _showExplanation = false;
  int _lives = 3;
  int _secondsLeft = 30;
  Timer? _timer;

  late AnimationController _feedbackController;
  late Animation<Color?> _bgColorAnim;

  bool _correctAnim = false;
  bool _wrongAnim = false;

  @override
  void initState() {
    super.initState();
    _feedbackController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _bgColorAnim = ColorTween(
      begin: Colors.transparent,
      end: Colors.transparent,
    ).animate(_feedbackController);

    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _feedbackController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _secondsLeft = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        if (_secondsLeft > 0) {
          _secondsLeft--;
        } else {
          t.cancel();
          if (!_answered) {
            _handleAnswer(-1); // time out = wrong
          }
        }
      });
    });
  }

  void _handleAnswer(int selectedIndex) {
    if (_answered) return;
    _timer?.cancel();

    final phase = _getPhase();
    final question = phase.questions[_currentQuestion];
    final isCorrect = selectedIndex == question.correctIndex;

    setState(() {
      _selectedAnswer = selectedIndex;
      _answered = true;
      _showExplanation = true;
      if (isCorrect) {
        _score++;
        _correctAnim = true;
      } else {
        _wrongAnim = true;
        _lives = (_lives - 1).clamp(0, 3);
      }
    });

    // Reset animation after delay
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) {
        setState(() {
          _correctAnim = false;
          _wrongAnim = false;
        });
      }
    });
  }

  void _nextQuestion() {
    final phase = _getPhase();
    final isLast = _currentQuestion >= phase.questions.length - 1;

    if (isLast) {
      _finishQuiz();
    } else {
      setState(() {
        _currentQuestion++;
        _selectedAnswer = null;
        _answered = false;
        _showExplanation = false;
      });
      _startTimer();
    }
  }

  void _finishQuiz() {
    _timer?.cancel();
    final gameState = context.read<GameState>();
    final phase = _getPhase();

    gameState.savePhaseResult(
      widget.phaseIndex,
      _score,
      phase.totalQuestions,
    );

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => ResultScreen(
          phaseIndex: widget.phaseIndex,
          score: _score,
          total: phase.totalQuestions,
        ),
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
      ),
    );
  }

  Phase _getPhase() {
    return context.read<GameState>().phases[widget.phaseIndex];
  }

  @override
  Widget build(BuildContext context) {
    final phase = context.watch<GameState>().phases[widget.phaseIndex];
    final question = phase.questions[_currentQuestion];
    final total = phase.totalQuestions;
    final progress = (_currentQuestion + 1) / total;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _correctAnim
                ? [const Color(0xFF0A2A12), const Color(0xFF0A1628)]
                : _wrongAnim
                    ? [const Color(0xFF2A0A0A), const Color(0xFF0A1628)]
                    : [const Color(0xFF0A1628), const Color(0xFF0D2044)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(phase, progress, total),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildQuestionCard(question),
                      const SizedBox(height: 20),
                      ..._buildOptions(question),
                      if (_showExplanation) ...[
                        const SizedBox(height: 16),
                        _buildExplanation(question),
                      ],
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              if (_answered) _buildNextButton(phase),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Phase phase, double progress, int total) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => _showExitDialog(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.close, color: Colors.white, size: 18),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      phase.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${_currentQuestion + 1} de $total perguntas',
                      style: const TextStyle(color: Colors.white38, fontSize: 11),
                    ),
                  ],
                ),
              ),

              // Timer
              _buildTimer(),

              const SizedBox(width: 10),

              // Lives
              _buildLives(),
            ],
          ),

          const SizedBox(height: 10),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation(phase.phaseColor),
            ),
          ),

          const SizedBox(height: 4),

          // Score
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '✅ $_score acertos',
              style: const TextStyle(color: Colors.white54, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    final isUrgent = _secondsLeft <= 10;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isUrgent ? Colors.red.withOpacity(0.3) : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isUrgent ? Colors.red.withOpacity(0.6) : Colors.white12,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.timer,
            color: isUrgent ? Colors.red : Colors.white54,
            size: 14,
          ),
          const SizedBox(width: 4),
          Text(
            '$_secondsLeft',
            style: TextStyle(
              color: isUrgent ? Colors.red : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLives() {
    return Row(
      children: List.generate(
        3,
        (i) => Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Icon(
            i < _lives ? Icons.favorite : Icons.favorite_border,
            color: i < _lives ? Colors.red : Colors.white24,
            size: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard(Question question) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.08),
            Colors.white.withOpacity(0.04),
          ],
        ),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Text(
        question.question,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
          height: 1.5,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  List<Widget> _buildOptions(Question question) {
    final labels = ['A', 'B', 'C', 'D'];
    return List.generate(question.options.length, (i) {
      final isSelected = _selectedAnswer == i;
      final isCorrect = i == question.correctIndex;

      Color borderColor = Colors.white.withOpacity(0.15);
      Color bgColor = Colors.white.withOpacity(0.06);
      Color textColor = Colors.white;
      Widget? trailingIcon;

      if (_answered) {
        if (isCorrect) {
          borderColor = Colors.green;
          bgColor = Colors.green.withOpacity(0.18);
          textColor = Colors.greenAccent;
          trailingIcon = const Icon(Icons.check_circle, color: Colors.green, size: 20);
        } else if (isSelected && !isCorrect) {
          borderColor = Colors.red;
          bgColor = Colors.red.withOpacity(0.18);
          textColor = Colors.redAccent;
          trailingIcon = const Icon(Icons.cancel, color: Colors.red, size: 20);
        }
      } else if (isSelected) {
        borderColor = Colors.white54;
        bgColor = Colors.white.withOpacity(0.12);
      }

      return GestureDetector(
        onTap: _answered ? null : () => _handleAnswer(i),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: bgColor,
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _answered && isCorrect
                      ? Colors.green.withOpacity(0.3)
                      : _answered && isSelected && !isCorrect
                          ? Colors.red.withOpacity(0.3)
                          : Colors.white.withOpacity(0.1),
                  border: Border.all(color: borderColor.withOpacity(0.6)),
                ),
                child: Center(
                  child: Text(
                    labels[i],
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  question.options[i],
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
              ),
              if (trailingIcon != null) trailingIcon,
            ],
          ),
        ),
      );
    });
  }

  Widget _buildExplanation(Question question) {
    final isCorrect = _selectedAnswer == question.correctIndex;
    return AnimatedOpacity(
      opacity: _showExplanation ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isCorrect
              ? Colors.green.withOpacity(0.12)
              : Colors.orange.withOpacity(0.12),
          border: Border.all(
            color: isCorrect
                ? Colors.green.withOpacity(0.4)
                : Colors.orange.withOpacity(0.4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  isCorrect ? '✅ Correto!' : '❌ Incorreto',
                  style: TextStyle(
                    color: isCorrect ? Colors.greenAccent : Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                if (!isCorrect) ...[
                  const SizedBox(width: 8),
                  Text(
                    '• Resposta: ${['A', 'B', 'C', 'D'][question.correctIndex]}',
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 6),
            Text(
              question.explanation,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton(Phase phase) {
    final isLast = _currentQuestion >= phase.questions.length - 1;
    return Container(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: _nextQuestion,
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            gradient: LinearGradient(
              colors: [phase.phaseColor, phase.phaseColor.withOpacity(0.8)],
            ),
            boxShadow: [
              BoxShadow(
                color: phase.phaseColor.withOpacity(0.4),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              isLast ? 'VER RESULTADO' : 'PRÓXIMA PERGUNTA',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 15,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1A3A6B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Sair do Quiz?',
            style: TextStyle(color: Colors.white)),
        content: const Text(
          'Seu progresso nesta tentativa será perdido.',
          style: TextStyle(color: Colors.white60),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Continuar',
                style: TextStyle(color: Color(0xFFFFD700))),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
              Navigator.pop(context); // go back to map
            },
            child: const Text('Sair', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
