import 'package:flutter/material.dart';


class NumberLearningScreen extends StatefulWidget {
  const NumberLearningScreen({super.key});

  @override
  State<NumberLearningScreen> createState() => _NumberLearningScreenState();
}

class _NumberLearningScreenState extends State<NumberLearningScreen> {
  final List<String> numbers = [
    'Zero',
    'Um',
    'Dois',
    'Três',
    'Quatro',
    'Cinco',
    'Seis',
    'Sete',
    'Oito',
    'Nove',
  ];

  final List<int> quantities = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
  ];

  int currentNumberIndex = 0;

  void nextNumber() {
    setState(() {
      if (currentNumberIndex < numbers.length - 1) {
        currentNumberIndex++;
      } else {
        currentNumberIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aprendendo Números'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              numbers[currentNumberIndex],
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                quantities[currentNumberIndex],
                (index) => Icon(
                  Icons.circle,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              quantities[currentNumberIndex].toString(),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: nextNumber,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
