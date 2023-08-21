import 'package:adapted_math/src/screens/intro/game/menu.dart';
import 'package:adapted_math/src/screens/intro/score/score_page.dart';
import 'package:adapted_math/src/shared/utils/app_confing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final appSettings = Provider.of<AppSettings>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        automaticallyImplyLeading: false,
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MenuScreen(),
                  ),
                );
              },
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
              icon:
                  IconButton(icon: const Icon(Icons.person), onPressed: () {}),
              label: 'Perfil'),
        ],
        onTap: (index) {
        },
      ),
    );
  }
}

