import 'package:flutter/material.dart';

class MathPuzzleGameScreen extends StatefulWidget {
  const MathPuzzleGameScreen({Key? key}) : super(key: key);

  @override
  State<MathPuzzleGameScreen> createState() => _MathPuzzleGameScreenState();
}

class _MathPuzzleGameScreenState extends State<MathPuzzleGameScreen> {
  List<int> numbers = [1,2,3,4,5,6,7,8,9];
  List<int> solution = [];
  bool isSolved = false;

  @override
  void initState() {
    super.initState();
    generatePuzzle();
  }

void generatePuzzle() {
  numbers.shuffle();
  solution = numbers.toList();
  solution.sort();

  isSolved = false;
}


  void checkSolution() {
    setState(() {
      isSolved = (numbers.toString() == solution.toString());
    });
  }

  void shuffleNumbers() {
    setState(() {
      numbers.shuffle();
      isSolved = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemSize = (screenWidth - 16 * 2 - 8 * 2 - 16) / 3;

    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: itemSize / (itemSize + 32),
              ),
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return DragTarget<int>(
                  onAccept: (value) {
                    setState(() {
                      numbers.remove(value);
                      numbers.insert(index, value);
                    });
                  },
                  builder: (context, candidateData, rejectedData) {
                    return Draggable<int>(
                      data: numbers[index],
                      feedback: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: itemSize,
                        height: itemSize,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            numbers[index].toString(),
                            style: const TextStyle(fontSize: 32, color: Colors.white),
                          ),
                        ),
                      ),
                      childWhenDragging: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: itemSize,
                        height: itemSize,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: itemSize,
                        height: itemSize,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            numbers[index].toString(),
                            style: const TextStyle(fontSize: 32, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: checkSolution,
              child: const Text('Verificar Solução'),
            ),
            const SizedBox(height: 16),
            if (isSolved)
              const Text(
                'Parabéns! Você resolveu o quebra-cabeça!',
                style: TextStyle(fontSize: 20),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: shuffleNumbers,
              child: const Text('Embaralhar Números'),
            ),
          ],
        ),
      ),
    );
  }
}
