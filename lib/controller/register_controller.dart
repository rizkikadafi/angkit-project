import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  final password = TextEditingController();
  final username = TextEditingController();
  final farmName = TextEditingController();
  final farmLocation = TextEditingController();
  String role = '';

  void updateRole(String newRole) {
    role = newRole;
  }

  Future<bool> register() async {
    Uri uri = Uri.parse("http://angkit.ktsabit.com/checkUser");

    Map data = {"username": username.text};

    var result = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));

    print(result.body);

    Map check = jsonDecode(result.body);

    if (check["status"] == "ok") {
      return true;
    }
    return false;
    // return true;
  }

  Future<bool> registRole() async {
    print(username.text);
    print(password.text);
    print(role);

    // if (role != "") {
    //   return true;
    // } else {
    //   return false;
    // }

    if (role != "") {
      Uri uri = Uri.parse("http://angkit.ktsabit.com/register");

      Map data = {
        "username": username.text,
        "password": password.text,
        "role": role
      };

      print(data);

      var result = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));

      print(result.body);

      return true;
    } else {
      return false;
    }
  }

  Future<bool> information(String username) async {
    Uri uri = Uri.parse("http://angkit.ktsabit.com/");

    Map data = {
      "username": username,
      "nama": farmName.text,
      "lokasi": farmLocation.text,
    };

    var result = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));


    return true;
    // prepare conditions when the request fails
  }
}
