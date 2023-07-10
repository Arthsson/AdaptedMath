import 'package:flutter/material.dart';

class MathRhythmGameScreen extends StatefulWidget {
  const MathRhythmGameScreen({Key? key}) : super(key: key);

  @override
  State<MathRhythmGameScreen> createState() => _MathRhythmGameScreenState();
}

class _MathRhythmGameScreenState extends State<MathRhythmGameScreen> {
  int targetNumber = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    generateTargetNumber();
  }

  void generateTargetNumber() {
    setState(() {
      targetNumber = 1 + (DateTime.now().microsecondsSinceEpoch % 10);
    });
  }

  void increaseScore() {
    setState(() {
      score++;
      generateTargetNumber();
    });
  }

  void resetScore() {
    setState(() {
      score = 0;
      generateTargetNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Toque na tela quando o número for $targetNumber',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 16),
          Text(
            'Pontuação: $score',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increaseScore,
        child: const Icon(Icons.touch_app),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: resetScore,
          child: const Text('Reiniciar Pontuação'),
        ),
      ),
    );
  }
}
