import 'package:angkit_project/controller/register_controller.dart';
import 'package:angkit_project/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';

class RegisterPage4 extends StatefulWidget {
  final RegisterController controller;
  const RegisterPage4({super.key, required this.controller});

  @override
  State<RegisterPage4> createState() => _RegisterPage4State();
}

class _RegisterPage4State extends State<RegisterPage4> {
  FocusNode focusNode = FocusNode();
  FocusNode ufocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  SizedBox(height: 70),
                  CustomStepper(step: 4),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 35),
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 180.0,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Selamat!",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "Anda sudah berhasil terdaftar di aplikasi Angkit Agro.",
                    style: TextStyle(
                        fontSize: 12, color: Color.fromARGB(255, 60, 60, 60)),
                  ),
                  Text(
                    "Silakan Tekan Selesai untuk masuk ke akun anda.",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  SizedBox(height: 130),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/loginPage');
                  },
                  child: const Text('Selesai'),
                ),
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
