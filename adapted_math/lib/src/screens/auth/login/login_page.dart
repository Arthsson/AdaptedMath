import 'package:adapted_math/src/screens/auth/config/config_page.dart';
import 'package:adapted_math/src/screens/intro/game/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/utils/app_confing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontSize: appSettings.fontSize),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConfigScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Login',
                  labelStyle: TextStyle(fontSize: appSettings.fontSize),
                ),
                style: TextStyle(fontSize: appSettings.fontSize),
              ),
              const SizedBox(height: 16.0),
              TextField(
                obscureText: isObscure,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(fontSize: appSettings.fontSize),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                ),
                style: TextStyle(fontSize: appSettings.fontSize),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuScreen()),
                  );
                },
                child: Text(
                  'Logar',
                  style: TextStyle(fontSize: appSettings.fontSize),
                ),
              ),
              const SizedBox(height: 8.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuScreen()),
                  );
                },
                child: Image.asset(
                  'assets/google.png',
                  height: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
