import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  static final password = TextEditingController();
  static final username = TextEditingController();
  static final farmName = TextEditingController();
  static final farmLocation = TextEditingController();
  static String role = '';

  void dispose() {
    password.dispose();
    username.dispose();
    farmName.dispose();
    farmLocation.dispose();
    role = '';
  }

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
    String endpoint = role == 'Peternakan' ? 'addPeternakan' : 'addDistributor';
    Uri uri = Uri.parse("http://angkit.ktsabit.com/$endpoint");

    Map data = {
      "username": username,
      "nama": farmName.text,
      "lokasi": farmLocation.text,
    };

    var result = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (jsonDecode(result.body)['status'] == 'ok') {
      return true;
    }
    return false;
  }
}
