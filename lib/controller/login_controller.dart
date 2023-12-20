import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final username = TextEditingController();
  final password = TextEditingController();

  Future<bool> login() async {
    print(username.text);
    print(password.text);

    Uri uri = Uri.parse("http://angkit.ktsabit.com/login");

    Map data = {"username": username.text, "password": password.text};

    var result = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));

    print(result.body);

    Map check = jsonDecode(result.body);

    if (check["status"] == "ok") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("username", username.text);

      // Navigator.of(context).push(MaterialPageRoute(builder: Home(context) => (password: passwordController.text, username: usernameController.text,)));
      return true;
    }
    print(check);
    Fluttertoast.showToast(msg: check['status'], backgroundColor: Colors.red);
    return false;
    return true;
  }
}
