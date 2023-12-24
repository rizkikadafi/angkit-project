import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff3A7E48);
const Color secondaryColor = Color(0xff66B357);

class AppTheme{
  static TextStyle label = const TextStyle(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );

  static TextStyle labelLg = const TextStyle(
    fontSize: 18,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );
}

ThemeData themeData = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    secondary: secondaryColor,
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: const BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    alignLabelWithHint: false,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    labelStyle: const TextStyle(
      color: Colors.black54
    ),

    contentPadding: EdgeInsets.all(16),
    
    filled: true,
    fillColor: Colors.grey.shade200,

  ),

  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      alignLabelWithHint: false,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelStyle: const TextStyle(
          color: Colors.black54
      ),
      filled: true,
      fillColor: Colors.grey.shade200,
    ),
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
