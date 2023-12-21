import 'package:angkit_project/pages/batch_input_page.dart';
import 'package:angkit_project/pages/data_page.dart';
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
    '/registerPage2': (context) => const RegisterPage2(),
    '/registerPage3': (context) => const RegisterPage3(),
    '/registerPage4': (context) => const RegisterPage4(),
    '/homePage': (context) => const HomePage(),
    '/dataPage' : (context) => const DataPage(),
  };
}
