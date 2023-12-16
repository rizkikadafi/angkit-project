import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text(
          "Daftar",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xffAFAFAF),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: Container(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 14.0,
                        height: 14.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xff66B357),
                            width: 4.0,
                          ),
                        ),
                      ),
                      Container(
                        width: 48.0,
                        height: 2.5,
                        decoration: const BoxDecoration(
                          color: Color(0xff66B357),
                        ),
                      ),
                      Container(
                        width: 14.0,
                        height: 14.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xff66B357),
                            width: 4.0,
                          ),
                        ),
                      ),
                      Container(
                        width: 48.0,
                        height: 2.5,
                        decoration: const BoxDecoration(
                          color: Color(0xff66B357),
                        ),
                      ),
                      Container(
                        width: 14.0,
                        height: 14.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xffAFAFAF),
                            width: 4.0,
                          ),
                        ),
                      ),
                      Container(
                        width: 48.0,
                        height: 2.0,
                        decoration: const BoxDecoration(
                          color: Color(0xffAFAFAF),
                        ),
                      ),
                      Container(
                        width: 14.0,
                        height: 14.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xffAFAFAF),
                            width: 4.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Step 1",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      SizedBox(width: 25),
                      Text(
                        "Step 2",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      SizedBox(width: 25),
                      Text(
                        "Step 3",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 60, 60, 60)),
                      ),
                      SizedBox(width: 25),
                      Text(
                        "Selesai",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 60, 60, 60)),
                      ),
                    ],
                  ),
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
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const Text(
                    "Anda sudah berhasil terdaftar di aplikasi Angkit Agro.",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  const Text(
                    "Silakan Masuk untuk kembali ke akun anda",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  const SizedBox(height: 130),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text('Selesai'),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Sudah punya akun? ',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      children: [
                        TextSpan(
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff3C834B)),
                          text: 'Masuk',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
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
