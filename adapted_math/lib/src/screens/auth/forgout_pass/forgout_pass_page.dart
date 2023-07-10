// ignore_for_file: unused_field

import 'package:adapted_math/src/screens/auth/login/login_page.dart';
import 'package:flutter/material.dart';

class ForgoutPassScreen extends StatefulWidget {
  const ForgoutPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgoutPassScreen> createState() => _ForgoutPassScreenState();
}

class _ForgoutPassScreenState extends State<ForgoutPassScreen> {
  double _textSize = 20.0;
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Matemática Acessível',
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
            Text(
              'RECUPERAÇÃO DE SENHA',
              style: TextStyle(
                fontSize: _textSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      style: TextStyle(fontSize: _textSize),
                      decoration: const InputDecoration(
                        hintText: 'E-mail',
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
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Implementar a lógica de recuperação de senha
                }
              },
              child: Text(
                'Redefinir Senha',
                style: TextStyle(fontSize: _textSize),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                 Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
              },
              child: Text(
                'Voltar para o Login',
                style: TextStyle(fontSize: _textSize, color: Colors.white),
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
