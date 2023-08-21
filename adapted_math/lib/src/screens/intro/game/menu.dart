import 'package:adapted_math/src/screens/intro/profile/profile_page.dart';
import 'package:adapted_math/src/screens/intro/score/score_page.dart';
import 'package:adapted_math/src/screens/levels/test.dart';
import 'package:adapted_math/src/shared/utils/app_confing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);

    final levels = [
      Level(number: 1, isUnlocked: true, levelClear: true),
      Level(number: 2, isUnlocked: true, levelClear: false),
      Level(number: 3, isUnlocked: false, levelClear: false),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: levels.length,
        itemBuilder: (context, index) {
          final level = levels[index];

          return Card(
            child: ListTile(
              leading: level.levelClear
                  ? const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  : const Icon(Icons.star),
              title: Text(
                'Nível ${level.number}',
                style: TextStyle(fontSize: appSettings.fontSize),
              ),
              subtitle: level.isUnlocked
                  ? Text(
                      'Desbloqueado',
                      style: TextStyle(fontSize: appSettings.fontSize),
                    )
                  : Text(
                      'Bloqueado',
                      style: TextStyle(fontSize: appSettings.fontSize),
                    ),
              onTap: level.isUnlocked
                  ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(),
                        ),
                      );
                    }
                  : () {},
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
              icon: IconButton(
                  icon: const Icon(Icons.assignment),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScorePage(),
                      ),
                    );
                  }),
              label: 'Missões'),
          BottomNavigationBarItem(
              icon: IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  }),
              label: 'Perfil'),
        ],
        onTap: (index) {
        },
      ),
    );
  }
}

class Level {
  final int number;
  final bool isUnlocked;
  bool levelClear;

  Level(
      {required this.number,
      required this.isUnlocked,
      required this.levelClear});
}
