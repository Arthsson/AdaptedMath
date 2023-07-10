import 'package:adapted_math/src/screens/menu/menu_page.dart';
import 'package:adapted_math/src/screens/intro/profile/profile_page.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  double fontSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        title: const Text(
          'Pontuação',
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
            onPressed: () {},
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Recordes',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.gamepad),
                title: Text(
                  'Jogo 1',
                  style: TextStyle(fontSize: fontSize),
                ),
                subtitle: Text(
                  'Pontuação: 1000',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.gamepad),
                title: Text(
                  'Jogo 2',
                  style: TextStyle(fontSize: fontSize),
                ),
                subtitle: Text(
                  'Pontuação: 500',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              // Repita o padrão para cada jogo

              const SizedBox(height: 24),
              Text(
                'Missões',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.star),
                title: Text(
                  'Missão 1',
                  style: TextStyle(fontSize: fontSize),
                ),
                subtitle: Text(
                  'Concluída',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: Text(
                  'Missão 2',
                  style: TextStyle(fontSize: fontSize),
                ),
                subtitle: Text(
                  'Em progresso',
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
                  max: 25.0,
                  onChanged: (newValue) {
                    setState(() {
                      fontSize = newValue;
                    });
                  },
                ),
              ],
            )
              // Repita o padrão para cada missão
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
