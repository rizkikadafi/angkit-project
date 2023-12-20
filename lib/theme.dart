import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff3A7E48);
const Color secondaryColor = Color(0xff66B357);

ThemeData themeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    secondary: secondaryColor,
  ),

  cardTheme: const CardTheme(
    color: Colors.white,
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24
    ),
    titleSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  ),
);
