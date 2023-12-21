import 'package:angkit_project/navigator.dart';
import 'package:angkit_project/pages/camera_page.dart';
import 'package:angkit_project/pages/register/register_page1.dart';
import 'package:angkit_project/theme.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? username = preferences.getString("username");
  debugPrint(username);
  runApp(MyApp(
    username: username,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.username,
  });

  final String? username;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Angkit Agro',
      theme: themeData,
      // home: TakePictureScreen(),
      initialRoute: username == null ? '/loginPage' : '/homePage',
      routes: SectionNavigator.routes,
    );
  }
}
