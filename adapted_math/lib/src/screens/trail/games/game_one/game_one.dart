import 'package:flutter/material.dart';
import 'dart:math';

class MathGameScreen extends StatefulWidget {
  const MathGameScreen({Key? key}) : super(key: key);

  @override
  State<MathGameScreen> createState() => _MathGameScreenState();
}

class _MathGameScreenState extends State<MathGameScreen> {
  late int num1;
  late int num2;
  late String operator;
  late int correctAnswer;
  late int userAnswer;
  bool showAnswer = false;
  bool showNextButton = false;
  double fontSize = 18.0;
  TextEditingController answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    final random = Random();
    num1 = random.nextInt(10) + 1;
    num2 = random.nextInt(10) + 1;

    switch (random.nextInt(4)) {
      case 0:
        operator = '+';
        correctAnswer = num1 + num2;
        break;
      case 1:
        operator = '-';
        correctAnswer = num1 - num2;
        break;
      case 2:
        operator = 'x';
        correctAnswer = num1 * num2;
        break;
      case 3:
        operator = '÷';
        correctAnswer = num1 ~/ num2;
        break;
    }

    userAnswer = 0;
    showAnswer = false;
    showNextButton = false;
    answerController.text = '';
  }

  void checkAnswer() {
    setState(() {
      showAnswer = true;
      showNextButton = true;
    });
  }

  void nextQuestion() {
    setState(() {
      generateQuestion();
    });
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo de Matemática'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$num1 $operator $num2',
              style: TextStyle(fontSize: fontSize),
            ),
            const SizedBox(height: 16),
            if (showAnswer)
              Text(
                'Resposta correta: $correctAnswer',
                style: TextStyle(fontSize: fontSize),
              ),
            const SizedBox(height: 8),
            if (showAnswer)
              Text(
                userAnswer == correctAnswer ? 'Resposta correta!' : 'Resposta incorreta.',
                style: TextStyle(fontSize: fontSize),
              ),
            const SizedBox(height: 16),
            if (!showAnswer)
              TextField(
                controller: answerController,
                onChanged: (value) {
                  setState(() {
                    userAnswer = int.tryParse(value) ?? 0;
                  });
                },
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: fontSize),
              ),
            const SizedBox(height: 16),
            if (!showAnswer)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        userAnswer = 0;
                        answerController.text = '';
                      });
                    },
                    child: Text(
                      'Limpar',
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: checkAnswer,
                    child: Text(
                      'Verificar',
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            if (showNextButton)
              ElevatedButton(
                onPressed: nextQuestion,
                child: const Text('Próxima Pergunta'),
              ),
            const SizedBox(height: 16),
            Slider(
              value: fontSize,
              min: 10,
              max: 35,
              onChanged: (value) {
                setState(() {
                  fontSize = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
