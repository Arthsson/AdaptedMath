import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  double _fontSize = 20.0;
  bool _voiceCommandEnabled = false;
  bool _textToSpeechEnabled = false;
  bool _colorBlindModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tamanho da Fonte:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Slider(
              value: _fontSize,
              min: 15.0,
              max: 30.0,
              divisions: 12,
              onChanged: (value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),
            const SizedBox(height: 24.0),
            ListTile(
              title: const Text('Comando de Voz'),
              trailing: Switch(
                value: _voiceCommandEnabled,
                onChanged: (value) {
                  setState(() {
                    _voiceCommandEnabled = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Leitura de Texto'),
              trailing: Switch(
                value: _textToSpeechEnabled,
                onChanged: (value) {
                  setState(() {
                    _textToSpeechEnabled = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Modo Daltonico'),
              trailing: Switch(
                value: _colorBlindModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _colorBlindModeEnabled = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Exemplo:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: _colorBlindModeEnabled ? Colors.red : Colors.white,
                child: Text(
                  'Exemplo de Texto',
                  style: TextStyle(
                    fontSize: _fontSize,
                    color: _colorBlindModeEnabled ? Colors.green : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
