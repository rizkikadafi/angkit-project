import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:angkit_project/pages/login.dart';
import 'package:angkit_project/components/custom_stepper.dart';

class RegisterFinish extends StatefulWidget {
  const RegisterFinish({super.key});

  @override
  State<RegisterFinish> createState() => _RegisterFinishState();
}

class _RegisterFinishState extends State<RegisterFinish> {
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
                children: [
                  const SizedBox(height: 70),
                  CustomStepper(step: 4),
                  const SizedBox(height: 35),
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 180.0,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Selamat!",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const Text(
                    "Anda sudah berhasil terdaftar di aplikasi Angkit Agro.",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  const Text(
                    "Silakan Tekan Selesai untuk masuk ke akun anda.",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  const SizedBox(height: 130),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                      },
                      child: const Text('Selesai'),
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
