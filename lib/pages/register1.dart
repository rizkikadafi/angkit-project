import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:angkit_project/pages/register2.dart';
import 'package:angkit_project/components/custom_stepper.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  FocusNode focusNode = FocusNode();
  FocusNode ufocusNode = FocusNode();

  void Register() async {
    // print(usernameController.text);

    Uri uri = Uri.parse("http://angkit.ktsabit.com/checkUser");

    Map data = {"username": usernameController.text};

    var result = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));

    print(result.body);

    Map apa = {"data": "Username available", "status": "ok"};

    print(["status"]);

    if (apa["status"] == "ok") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterStep2(password: passwordController.text, username: usernameController.text,)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 70),
                  CustomStepper(step: 1),
                  const SizedBox(height: 50),
                  const Text(
                    "Daftar",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    // obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffF6F6F6),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff66B357),
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffAFAFAF),
                        ),
                      ),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          color: focusNode.hasFocus
                              ? Color(0xff3C834B)
                              : Colors.black54),
                    ),
                    controller: usernameController,
                    onTap: () {
                      setState(() {
                        FocusScope.of(context).requestFocus(focusNode);
                      });
                    },
                    focusNode: focusNode,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffF6F6F6),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff66B357),
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffAFAFAF),
                        ),
                      ),
                      labelText: 'Sandi',
                      labelStyle: TextStyle(
                          color: ufocusNode.hasFocus
                              ? Color(0xff3C834B)
                              : Colors.black54),
                    ),
                    controller: passwordController,
                    onTap: () {
                      setState(() {
                        FocusScope.of(context).requestFocus(ufocusNode);
                      });
                    },
                    focusNode: ufocusNode,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: Register,
                      child: const Text('Lanjut'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
