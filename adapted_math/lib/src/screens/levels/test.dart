import 'package:adapted_math/src/screens/intro/game/menu.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int attempts = 0;
  List<Question> questions = [
    Question('2 + 3', 5, [4, 6, 7, 5]),
    Question('1 + 7', 8, [9, 6, 5, 8]),
    Question('4 + 1', 5, [3, 5, 6, 7],),
    Question('6 + 2', 8, [8, 9, 5, 7]),
    Question('3 + 4', 7, [8, 5, 7, 6]),
    Question('2 + 6', 8, [8, 9, 7, 5]),
    Question('5 + 2', 7, [6, 8, 9, 7]),
    Question('4 + 3', 7, [6, 7, 8, 5]),
    Question('1 + 6', 7, [8, 7, 5, 6]),
    Question('2 + 4', 6, [5, 6, 8, 7])
    // Adicione outras perguntas aqui
  ];

  bool showResult = false;
  bool showHint = false;

  void checkAnswer(int selectedAnswer) {
    if (selectedAnswer == questions[currentQuestionIndex].correctAnswer) {
      setState(() {
        currentQuestionIndex++;
        attempts = 0;
        showResult = false;
        showHint = false;
      });
    } else {
      setState(() {
        attempts++;
        if (attempts >= 3) {
          showHint = true;
        }
        if (attempts >= 5) {
          currentQuestionIndex++;
          attempts = 0;
          showHint = false;
        }
        showResult = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Nível 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pergunta ${currentQuestionIndex + 1}: ${questions[currentQuestionIndex].questionText}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                ...questions[currentQuestionIndex]
                    .options
                    .asMap()
                    .entries
                    .map(
                      (entry) => OptionCard(
                        text: entry.value.toString(),
                        isSelected: showResult &&
                            entry.value ==
                                questions[currentQuestionIndex].correctAnswer,
                        onTap: () {
                          if (!showResult) {
                            checkAnswer(entry.value);
                          }
                        },
                      ),
                    )
                    .toList(),
              ],
            ),
            SizedBox(height: 20),
            if (showResult)
              Text(
                showHint
                    ? 'Tente novamente ou use a dica!'
                    : 'Resposta incorreta. Tente novamente!',
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showHint = false;
                  showResult = false;
                });
              },
              child: Text('Próxima Pergunta'),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final int correctAnswer;
  final List<int> options;

  Question(this.questionText, this.correctAnswer, this.options);
}

class OptionCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionCard({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
      ),
    );
  }
}
