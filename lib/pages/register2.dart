import 'dart:convert';
import 'package:angkit_project/pages/register1.dart';
import 'package:angkit_project/pages/register3.dart';
import 'package:angkit_project/components/custom_stepper.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class RegisterStep2 extends StatefulWidget {
  RegisterStep2({super.key, required this.password, required this.username});

  final password;
  final username;

  @override
  State<RegisterStep2> createState() => _RegisterStep2State();
}

class _RegisterStep2State extends State<RegisterStep2> {
  FocusNode focusNode = FocusNode();
  FocusNode ufocusNode = FocusNode();

  String role = '';

  void Role() async {

    print(widget.username);
    print(widget.password);
    print(role);

    if (role != "") {
      Uri uri = Uri.parse("http://angkit.ktsabit.com/register");

      Map data = {"username": widget.username, "password": widget.password, "role": role};

      print(data);

      var result = await http.post(uri, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',}, body: jsonEncode(data));
      
      print(result.body);

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterStep3(password: widget.password, username: widget.username, role: role,)));
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
                  CustomStepper(step: 2),
                  const SizedBox(height: 50),
                  const Text(
                    "Pilih Peran!",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  RadioListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    value: 'Peternakan',
                    groupValue: role,
                    onChanged: (val) {
                      setState(() {
                        role = val!;
                      });
                    },
                    title: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Icon(Icons.factory_rounded),
                          SizedBox(width: 10),
                          Text(
                            'Peternakan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle:
                        const Text('Ngetik apa ya jadi peternak adalah benar'),
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  const Divider(),
                  RadioListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    value: 'Distributor',
                    groupValue: role,
                    onChanged: (val) {
                      setState(() {
                        role = val!;
                      });
                    },
                    title: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Icon(Icons.delivery_dining_rounded),
                          SizedBox(width: 10),
                          Text(
                            'Distributor',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: const Text('Bawa bebek pake motor. cakep!'),
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: Role,
                  child: const Text("Lanjut"),
                ),
              ),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
