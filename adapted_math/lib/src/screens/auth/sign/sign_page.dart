// ignore_for_file: unused_field

import 'package:adapted_math/src/screens/auth/login/login_page.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  double _textSize = 20.0;
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  DateTime? _selectedDate;
  String _password = '';
  String _confirmPassword = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

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
              'CADASTRO',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      style: TextStyle(fontSize: _textSize),
                      decoration: const InputDecoration(
                        hintText: 'Data de Nascimento',
                      ),
                      onTap: () {
                        _selectDate(context);
                      },
                      readOnly: true,
                      validator: (value) {
                        if (_selectedDate == null) {
                          return 'Por favor, selecione uma data de nascimento válida.';
                        }
                        return null;
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
                      obscureText: true,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      style: TextStyle(fontSize: _textSize),
                      decoration: const InputDecoration(
                        hintText: 'Confirmar Senha',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value != _password) {
                          return 'As senhas não coincidem.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _confirmPassword = value ?? '';
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
                  // Implementar a lógica de cadastro do usuário
                }
              },
              child: Text(
                'Cadastrar',
                style: TextStyle(fontSize: _textSize),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
              },
              child: Text(
                'Fazer Login',
                style: TextStyle(fontSize: _textSize),
              ),
            ),
            const SizedBox(height: 10),
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
