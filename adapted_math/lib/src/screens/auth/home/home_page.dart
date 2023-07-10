import 'package:adapted_math/src/screens/auth/base_auth_page.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {

  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAuthPage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              'assets/logo_app.png',
              height: 100,
          ),
          const SizedBox(height: 8),
          const Text(
            'Educação Inclusiva',
          ),
          const SizedBox(height: 16),
          const Text(
            'Seja bem-vindo! Se for seu primeiro acesso, por favor, vá para as configurações para personalizar sua experiência.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/config');
            },
          ),
          ElevatedButton(
            onPressed: () {
               Navigator.pushNamed(context, '/login');
            },
            child: const Text('Avançar'),
          ),
        ],
      ),
    );
  }
}