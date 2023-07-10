import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class MathMemoryGameScreen extends StatefulWidget {
  const MathMemoryGameScreen({Key? key}) : super(key: key);

  @override
  State<MathMemoryGameScreen> createState() => _MathMemoryGameScreenState();
}

class _MathMemoryGameScreenState extends State<MathMemoryGameScreen> {
  List<int> numbers = [];
  List<int> selectedNumbers = [];
  List<int> matchedNumbers = [];
  Timer? _timer;
  int score = 0;

  @override
  void initState() {
    super.initState();
    generateNumbers();
  }

  void generateNumbers() {
    final random = Random();
    numbers = List<int>.generate(10, (_) => random.nextInt(100));
  }

  void checkSelectedNumber(int index) {
    setState(() {
      selectedNumbers.add(index);
    });

    if (selectedNumbers.length == 2) {
      final firstIndex = selectedNumbers[0];
      final secondIndex = selectedNumbers[1];

      if (numbers[firstIndex] == numbers[secondIndex]) {
        matchedNumbers.addAll(selectedNumbers);
        score++;
        if (matchedNumbers.length == numbers.length) {
          _timer?.cancel();
          showResults();
        }
      }

      selectedNumbers.clear();
    }
  }

  void showResults() {
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
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memória Matemática'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: numbers.length,
              itemBuilder: (BuildContext context, int index) {
                if (matchedNumbers.contains(index)) {
                  return Container();
                } else if (selectedNumbers.contains(index)) {
                  return ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      numbers[index].toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                  );
                } else {
                  return ElevatedButton(
                    onPressed: () {
                      checkSelectedNumber(index);
                    },
                    child: const Text(
                      '?',
                      style: TextStyle(fontSize: 24),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
