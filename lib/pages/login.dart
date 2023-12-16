import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode ufocusNode = FocusNode();

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
                aspectRatio: 10/8,
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
              Column(
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
                      labelText: 'Username',
                      labelStyle: TextStyle(color:focusNode.hasFocus? Color(0xff3C834B)
                      :Colors.black54),
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
                      labelStyle: TextStyle(color:ufocusNode.hasFocus? Color(0xff3C834B)
                      :Colors.black54),
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
                      onPressed: () {},
                      child: const Text('Masuk'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 150),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Belum punya akun? ',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      children: [
                        TextSpan(
                          style: TextStyle(fontSize: 15, color: Color(0xff3C834B)),
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
