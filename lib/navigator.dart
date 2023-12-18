import 'package:angkit_project/pages/batch_input_page.dart';
import 'package:angkit_project/pages/home_page.dart';
import 'package:angkit_project/pages/login_page.dart';
import 'package:angkit_project/pages/register/register_page1.dart';
import 'package:angkit_project/pages/register/register_page2.dart';
import 'package:angkit_project/pages/register/register_page3.dart';
import 'package:angkit_project/pages/register/register_page4.dart';
import 'package:flutter/material.dart';

class SectionNavigator {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/batchInputPage': (context) => const BatchInputPage(),
    '/loginPage': (context) => const LoginPage(),
    '/registerPage1': (context) => const RegisterPage1(),
    '/registerPage2': (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      return RegisterPage2(controller: args['controller']);
    },
    '/registerPage3': (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      return RegisterPage3(controller: args['controller']);
    },
    '/registerPage4': (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      return RegisterPage4(controller: args['controller']);
    },
    '/homePage': (context) => const HomePage(),
  };
}
