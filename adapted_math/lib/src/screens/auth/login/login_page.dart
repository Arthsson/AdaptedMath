// ignore_for_file: unused_field

import 'package:adapted_math/src/screens/auth/forgout_pass/forgout_pass_page.dart';
import 'package:adapted_math/src/screens/menu/menu_page.dart';
import 'package:adapted_math/src/screens/auth/sign/sign_page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double _textSize = 20.0;
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

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
              Icons.settings,
              size: 28,
            ),
            onPressed: () {
              // Navegar para a tela de configurações (substitua pela tela desejada)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConfiguracoesScreen(),
                ),
              );
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LOGIN', style:
              TextStyle(
                fontSize: _textSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      style:TextStyle(fontSize: _textSize),
                      decoration: const InputDecoration(
                        hintText: 'Email'
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um e-mail válido.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value ?? '';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      style: TextStyle(fontSize: _textSize),
                      decoration: const InputDecoration(
                        hintText: 'Senha',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira uma senha válida.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value ?? '';
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GameSelectionScreen(),
                ),
              );
              },
              child: Text('Logar', style: TextStyle(fontSize: _textSize),),
            ),
            const SizedBox(height: 10),
            ElevatedButton(

              onPressed: () {
                // Implementar a lógica de login com o Google
              },
              child: Text('Login com Google', style: TextStyle(fontSize: _textSize),),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
              // Navegar para a tela de configurações (substitua pela tela desejada)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            },
              child: Text('Cadastre-se',style: TextStyle(fontSize: _textSize, color: Colors.white),),
            ),
            TextButton(
              onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgoutPassScreen(),
                ),
              );
              },
              child: Text('Esqueceu a senha?',style:TextStyle(fontSize: _textSize, color: Colors.white),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.format_size,
                  color: Colors.white,
                ),
                Slider(
                  value: _textSize,
                  min: 10.0,
                  max: 30.0,
                  onChanged: (newValue) {
                    setState(() {
                      _textSize = newValue;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ConfiguracoesScreen extends StatelessWidget {
  const ConfiguracoesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: const Center(
        child: Text('Esta é a tela de configurações'),
      ),
    );
  }
}
