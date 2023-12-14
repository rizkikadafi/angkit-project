import 'package:angkit_project/pages/home_page.dart';
import 'package:angkit_project/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Angkit Agro',
      theme: themeData,
      home: const HomePage(),
    );
  }
}
