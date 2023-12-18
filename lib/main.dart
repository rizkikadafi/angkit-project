import 'package:angkit_project/navigator.dart';
import 'package:angkit_project/pages/register/register_page1.dart';
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
      initialRoute: '/registerPage1',
      routes: SectionNavigator.routes,
    );
  }
}
