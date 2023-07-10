import 'package:flutter/material.dart';

class MathMazeGameScreen extends StatefulWidget {
  const MathMazeGameScreen({Key? key}) : super(key: key);

  @override
  State<MathMazeGameScreen> createState() => _MathMazeGameScreenState();
}

class _MathMazeGameScreenState extends State<MathMazeGameScreen> {
  final List<List<String>> maze = [
    ['1', '0', '0', '0', '0'],
    ['1', '1', '1', '1', '1'],
    ['0', '0', '0', '0', '1'],
    ['1', '1', '1', '0', '1'],
    ['E', '0', '0', '0', '1'],
  ];

  int playerX = 0;
  int playerY = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
  }

  void movePlayer(int newX, int newY) {
    if (newX >= 0 && newX < maze.length && newY >= 0 && newY < maze[0].length) {
      if (maze[newX][newY] != '0') {
        setState(() {
          playerX = newX;
          playerY = newY;

          if (maze[newX][newY] != 'E') {
            score += int.parse(maze[newX][newY]);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Labirinto'),
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
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemCount: maze.length * maze[0].length,
            itemBuilder: (context, index) {
              final row = index ~/ maze[0].length;
              final col = index % maze[0].length;

              return GestureDetector(
                onTap: () {
                  movePlayer(row, col);
                },
                child: Container(
                  color: maze[row][col] == '0' ? Colors.black : Colors.white,
                  child: Center(
                    child: Text(
                      maze[row][col],
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
