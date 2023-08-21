import 'package:flutter/material.dart';

class Level {
  final int number;
  final bool isUnlocked;
  bool levelClear;
  final VoidCallback onPressed; // Adicionado onPressed

  Level({
    required this.number,
    required this.isUnlocked,
    required this.levelClear,
    required this.onPressed, // Adicionado onPressed
  });
}
