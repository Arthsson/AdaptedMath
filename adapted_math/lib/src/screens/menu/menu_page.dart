import 'package:adapted_math/src/screens/trail/games/game_five/game_five.dart';
import 'package:adapted_math/src/screens/trail/games/game_four/game_four.dart';
import 'package:adapted_math/src/screens/trail/games/game_one/game_one.dart';
import 'package:adapted_math/src/screens/trail/games/game_seven/game_seven.dart';
import 'package:adapted_math/src/screens/trail/games/game_six/game_six.dart';
import 'package:adapted_math/src/screens/trail/games/game_three/game_three.dart';
import 'package:adapted_math/src/screens/trail/games/game_two/game_two.dart';
import 'package:adapted_math/src/screens/intro/profile/profile_page.dart';
import 'package:adapted_math/src/screens/score_page/score_page.dart';
import 'package:flutter/material.dart';

class GameSelectionScreen extends StatefulWidget {
  const GameSelectionScreen({Key? key}) : super(key: key);

  @override
  State<GameSelectionScreen> createState() => _GameSelectionScreenState();
}

class _GameSelectionScreenState extends State<GameSelectionScreen> {
  double fontSize = 18.0; // Tamanho de fonte padrão

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Matemática Inclusiva',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.keyboard_voice,
              size: 28,
            ),
            onPressed: () {
             
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueGrey,
              Colors.blue,
              Colors.greenAccent,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Escolha um jogo',
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MathGameScreen(),
                    ),
                  );
                },
                child: Text(
                  'Jogo 1',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MathPuzzleGameScreen(),
                    ),
                  );
                },
                child: Text(
                  'Jogo 2',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MathRhythmGameScreen(),
                    ),
                  );
                },
                child: Text(
                  'Jogo 3',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MathExplorationGameScreen(),
                    ),
                  );
                },
                child: Text(
                  'Jogo 4',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MathMazeGameScreen(),
                    ),
                  );
                },
                child: Text(
                  'Jogo 5',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MathRaceGameScreen(),
                    ),
                  );
                },
                child: Text(
                  'Jogo 6',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MathMemoryGameScreen(),
                    ),
                  );
                },
                child: Text(
                  'Jogo 7',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
               Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.format_size,
                  color: Colors.white,
                ),
                Slider(
                  value: fontSize,
                  min: 10.0,
                  max: 30.0,
                  onChanged: (newValue) {
                    setState(() {
                      fontSize = newValue;
                    });
                  },
                ),
              ],
            )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.gamepad_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameSelectionScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.leaderboard),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScoreScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
