import 'package:adapted_math/src/screens/intro/game/menu.dart';
import 'package:adapted_math/src/screens/intro/profile/profile_page.dart';
import 'package:adapted_math/src/shared/utils/app_confing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final appSettings = Provider.of<AppSettings>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Missoes'),
        automaticallyImplyLeading: false,
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
                  icon: const Icon(Icons.assignment), onPressed: () {}),
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
          // Lógica para navegar para outras telas ao clicar nos ícones do BottomNavigationBar
        },
      ),
    );
  }
}
