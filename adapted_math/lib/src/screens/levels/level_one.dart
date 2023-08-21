import 'package:adapted_math/src/shared/utils/app_confing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevelOneScreen extends StatefulWidget {
  const LevelOneScreen({super.key});

  @override
  State<LevelOneScreen> createState() => _LevelOneScreenState();
}

class _LevelOneScreenState extends State<LevelOneScreen> {
  int currentQuestionIndex = 0;
  int lives = 3;
  List<Question> questions = [
    Question(text: 'Qual é a soma de 2 + 1?', correctAnswer: '4', options: ['1', '2', '4', '7']),
    Question(text: 'Qual é a soma de 5 + 3?', correctAnswer: '8', options: ['4', '1', '8', '9']),
    Question(text: 'Qual é a soma de 7 + 1?', correctAnswer: '8', options: ['5', '6', '7', '8']),
    Question(text: 'Qual é a soma de 9 + 0?', correctAnswer: '8', options: ['5', '6', '7', '8']),
    Question(text: 'Qual é a soma de 7 + 1?', correctAnswer: '8', options: ['5', '6', '7', '8']),
  ];

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nível 1'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                questions[currentQuestionIndex].text,
                style: TextStyle(fontSize: appSettings.fontSize, color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: questions[currentQuestionIndex]
                  .options
                  .map((option) => RadioListTile(
                        title: Text(
                          option,
                          style: TextStyle(fontSize: appSettings.fontSize,color: Colors.black ),
                        ),
                        value: option,
                        groupValue: questions[currentQuestionIndex].selectedAnswer,
                        onChanged: (value) {
                          setState(() {
                            questions[currentQuestionIndex].selectedAnswer = value!;
                          });
                        },
                      ))
                  .toList(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _checkAnswerAndMoveToNextQuestion();
              },
              child: Text(
                'Responder',
                style: TextStyle(fontSize: appSettings.fontSize, color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Vidas: $lives',
              style: TextStyle(fontSize: appSettings.fontSize),
            ),
          ],
        ),
      ),
    );
  }

  void _checkAnswerAndMoveToNextQuestion() {
    Question currentQuestion = questions[currentQuestionIndex];
    if (currentQuestion.selectedAnswer == currentQuestion.correctAnswer) {
      currentQuestion.state = QuestionState.Correct;
      _moveToNextQuestion();
    } else {
      lives--;
      if (lives == 0) {
        // Game Over logic
      } else {
        _moveToNextQuestion();
      }
    }
  }

  void _moveToNextQuestion() {
    int nextQuestionIndex = questions.indexWhere((question) => question.state == QuestionState.Unanswered);
    if (nextQuestionIndex != -1) {
      setState(() {
        currentQuestionIndex = nextQuestionIndex;
      });
    } else {
      // All questions answered, show success message or move to next level
    }
  }
}

// ignore: constant_identifier_names
enum QuestionState { Unanswered, Correct, Incorrect }

class Question {
  final String text;
  final List<String> options;
  final String correctAnswer;
  QuestionState state = QuestionState.Unanswered;
  String selectedAnswer = '';

  Question({required this.text, required this.options, required this.correctAnswer});
}
