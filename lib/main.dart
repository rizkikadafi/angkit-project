import 'package:angkit_project/pages/register1.dart';
import 'package:flutter/material.dart';
import 'package:angkit_project/pages/login.dart';
import 'package:angkit_project/pages/register1.dart';
import 'package:angkit_project/pages/register2.dart';
import 'package:angkit_project/pages/register4.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Color(0xff66B357),
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: const Color(0xff66B357),
        //   brightness: Brightness.values[1],
        // ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
