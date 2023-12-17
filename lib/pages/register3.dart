import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:angkit_project/pages/register4.dart';
import 'package:angkit_project/pages/register2.dart';
import 'package:angkit_project/components/custom_stepper.dart';
import 'package:http/http.dart' as http;

class RegisterStep3 extends StatefulWidget {
  RegisterStep3({super.key, required this.password, required this.username, required this.role});

  final password;
  final username;
  final role;

  @override
  State<RegisterStep3> createState() => _RegisterStep3State();
}

class _RegisterStep3State extends State<RegisterStep3> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();

  FocusNode focusNode = FocusNode();
  FocusNode ufocusNode = FocusNode();

  void Information() async {

    Uri uri = Uri.parse("http://angkit.ktsabit.com/");

    Map data = {"username": widget.username, "password": widget.password, "role": widget.role, "": nameController.text, "": locationController.text,};

    var result = await http.post(uri, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',}, body: jsonEncode(data));
      
    print(result.body);

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterFinish(password: widget.password, username: widget.username, role: widget.role, name: nameController.text, location: locationController.text,)));

  }

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
                  const SizedBox(height: 50),
                  Text(
                    "Informasi ${widget.role}",
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
                      labelText: 'Nama ${widget.role}',
                      labelStyle: TextStyle(
                          color: focusNode.hasFocus
                              ? Color(0xff3C834B)
                              : Colors.black54),
                    ),
                    controller: nameController,
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
                      labelText: 'Lokasi ${widget.role}',
                      labelStyle: TextStyle(
                          color: ufocusNode.hasFocus
                              ? Color(0xff3C834B)
                              : Colors.black54),
                    ),
                    controller: locationController,
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
                      onPressed: Information,
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
