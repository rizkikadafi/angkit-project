import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:angkit_project/pages/login.dart';
import 'package:angkit_project/pages/register3.dart';
import 'package:angkit_project/components/custom_stepper.dart';

class RegisterStep2 extends StatefulWidget {
  const RegisterStep2({super.key});

  @override
  State<RegisterStep2> createState() => _RegisterStep2State();
}

class _RegisterStep2State extends State<RegisterStep2> {
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
                  CustomStepper(step: 2),
                  const SizedBox(height: 35),
                  const Text(
                    "Pilih Peran",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterStep3()));
                      },
                      child: const Text('Peternak'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterStep3()));
                      },
                      child: const Text('Distributor'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff3C834B)),
                      ),
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
