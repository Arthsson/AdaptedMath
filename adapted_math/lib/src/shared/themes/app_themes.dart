import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData defaultTheme = ThemeData(
    primaryColor: Colors.blueGrey,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.greenAccent),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue,
        backgroundColor: Colors.white,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
    ),
    cardTheme: const CardTheme(
      elevation: 4,
      shadowColor: Colors.grey,
      color: Colors.white,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white, 
    ),
    iconTheme: const IconThemeData(color: Colors.blueGrey),
  );
}