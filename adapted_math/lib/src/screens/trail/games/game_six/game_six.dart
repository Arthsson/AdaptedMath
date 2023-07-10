import 'dart:async';
import 'package:flutter/material.dart';

class MathRaceGameScreen extends StatefulWidget {
  const MathRaceGameScreen({Key? key}) : super(key: key);

  @override
  State<MathRaceGameScreen> createState() => _MathRaceGameScreenState();
}

class _MathRaceGameScreenState extends State<MathRaceGameScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  int timeLeft = 10;
  List<Question> questions = [
    Question('2 + 2', '4'),
    Question('5 - 3', '2'),
    Question('6 - 4', '2'),
    Question('15 ÷ 5', '3'),
  ];

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (timeLeft < 1) {
          timer.cancel();
          showResults();
        } else {
          timeLeft -= 1;
        }
      });
    });
  }

  void checkAnswer(String selectedAnswer) {
    if (selectedAnswer == questions[currentQuestionIndex].correctAnswer) {
      setState(() {
        score += 1;
      });
    }

    nextQuestion();
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex += 1;
        timeLeft = 10;
      });
    } else {
      showResults();
    }
  }

  void showResults() {
    _timer.cancel();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Text('Pontuação: $score'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tempo Restante: $timeLeft s',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Pontuação: $score',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              questions[currentQuestionIndex].questionText,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    checkAnswer('1');
                  },
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    checkAnswer('2');
                  },
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    checkAnswer('3');
                  },
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    checkAnswer('4');
                  },
                  child: const Text('4'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final String correctAnswer;

  Question(this.questionText, this.correctAnswer);
}
