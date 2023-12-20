import 'package:angkit_project/controller/login_controller.dart';
import 'package:angkit_project/validator/input_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  FocusNode focusNode = FocusNode();
  FocusNode ufocusNode = FocusNode();

  LoginController controller = LoginController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                            image: AssetImage("assets/img/angkit-logo.png"),
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
                      controller: controller.username,
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(focusNode);
                        });
                      },
                      focusNode: focusNode,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: passwordValidator,
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
                      controller: controller.password,
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
                            controller.login().then((value) {
                              if(value) {
                                Navigator.of(context).pushReplacementNamed('/homePage');
                              }
                            });
                          // if (_formKey.currentState!.validate()) {
                          //   controller.login().then((value) {
                          //     if(value) {
                          //       Navigator.of(context).popAndPushNamed('/homePage');
                          //     }
                          //   });
                          // }
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
                              Navigator.of(context).pushNamed('/registerPage1');
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
