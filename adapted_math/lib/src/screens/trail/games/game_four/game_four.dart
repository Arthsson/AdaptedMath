import 'package:flutter/material.dart';

class MathExplorationGameScreen extends StatefulWidget {
  const MathExplorationGameScreen({Key? key}) : super(key: key);

  @override
  State<MathExplorationGameScreen> createState() => _MathExplorationGameScreenState();
}

class _MathExplorationGameScreenState extends State<MathExplorationGameScreen> {
  int playerX = 0;
  int playerY = 0;
  int treasureX = 4;
  int treasureY = 4;
  int score = 0;

  @override
  void initState() {
    super.initState();
    generateTreasurePosition();
  }

  void generateTreasurePosition() {
    setState(() {
      treasureX = 1 + (DateTime.now().microsecondsSinceEpoch % 5);
      treasureY = 1 + (DateTime.now().microsecondsSinceEpoch % 5);
    });
  }

  void movePlayer(int newX, int newY) {
    setState(() {
      playerX = newX;
      playerY = newY;

      if (playerX == treasureX && playerY == treasureY) {
        score++;
        generateTreasurePosition();
      }
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
            'Posição do jogador: ($playerX, $playerY)',
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
        onPressed: () {
          // Implementar a lógica para exibir uma pergunta matemática ao jogador
          // e verificar se a resposta está correta antes de mover o jogador.
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
