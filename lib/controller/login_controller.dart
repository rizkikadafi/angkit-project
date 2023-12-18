import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginController {
  final username = TextEditingController();
  final password = TextEditingController();

  Future<bool> login() async {
    print(username.text);
    print(password.text);

    // Uri uri = Uri.parse("http://angkit.ktsabit.com/login");

    // Map data = {"username": username.text, "password": password.text};

    // var result = await http.post(uri,
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(data));

    // print(result.body);

    // Map check = jsonDecode(result.body);

    // if (check["status"] == "ok") {
    //   // Navigator.of(context).push(MaterialPageRoute(builder: Home(context) => (password: passwordController.text, username: usernameController.text,)));
    //   return true;
    // }
    // return false;
    return true;
  }
}
