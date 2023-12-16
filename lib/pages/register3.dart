import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:angkit_project/pages/login.dart';
import 'package:angkit_project/pages/register4.dart';
import 'package:angkit_project/components/custom_stepper.dart';

class RegisterStep3 extends StatefulWidget {
  const RegisterStep3({super.key});

  @override
  State<RegisterStep3> createState() => _RegisterStep3State();
}

class _RegisterStep3State extends State<RegisterStep3> {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode ufocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 1000,
      //   shadowColor: Colors.black,
      //   title: const Text(
      //     "Daftar",
      //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      //   ),
      // ),
      // appBar: AppBar(
      //   title: const Text(
      //     "Daftar",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       boxShadow: [
      //         BoxShadow(
      //           color: Color(0xffAFAFAF),
      //           blurRadius: 8.0,
      //         ),
      //       ],
      //     ),
      //     child: Container(
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
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
                  CustomStepper(step: 3),
                  const SizedBox(height: 35),
                  const Text(
                    "Informasi Peternakan",
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
                      labelText: 'Nama Peternakan',
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
                      labelText: 'Lokasi Peternakan',
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterFinish()));
                      },
                      child: const Text('Lanjut'),
                    ),
                  ),
                ],
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     RichText(
              //       text: TextSpan(
              //         text: 'Sudah punya akun? ',
              //         style: TextStyle(fontSize: 15, color: Colors.black),
              //         children: [
              //           TextSpan(
              //             recognizer: TapGestureRecognizer()
              //               ..onTap = () {
              //                 Navigator.of(context).push(MaterialPageRoute(
              //                     builder: (context) => const LoginPage()));
              //               },
              //             style:
              //                 TextStyle(fontSize: 15, color: Color(0xff3C834B)),
              //             text: 'Masuk',
              //           ),
              //         ],
              //       ),
              //     ),
              //     const SizedBox(height: 20),
              //   ],
              // ),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
