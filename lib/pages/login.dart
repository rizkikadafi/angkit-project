import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:angkit_project/pages/register1.dart';
import 'package:angkit_project/validator/login_validator.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  FocusNode focusNode = FocusNode();
  FocusNode ufocusNode = FocusNode();

  void Login() async {

    // print(usernameController.text);
    // print(passwordController.text);

    Uri uri = Uri.parse("http://angkit.ktsabit.com/login");

    Map data = {
      "username": usernameController.text,
      "password": passwordController.text
    };

    var result = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));

    print(result.body);

    Map check = jsonDecode(result.body);

      if (check["status"] == "ok") {
        // Navigator.of(context).push(MaterialPageRoute(builder: Home(context) => (password: passwordController.text, username: usernameController.text,)));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: const Text('Login'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 10 / 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 0),
                    Container(
                      padding: const EdgeInsets.only(top: 100),
                      height: 130,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/logo 1.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Seller Center",
                      style: TextStyle(fontSize: 16, color: Color(0xff3C834B)),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Masuk",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 35),
                    TextFormField(
                      validator: textValidator,
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Login();
                          }
                        },
                        child: const Text('Masuk'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 150),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Belum punya akun? ',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const RegisterPage()));
                            },
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff3C834B)),
                          text: 'Daftar',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
