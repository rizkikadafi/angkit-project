import 'package:flutter/material.dart';
import 'package:angkit_project/pages/register3.dart';
import 'package:angkit_project/pages/register1.dart';
import 'package:angkit_project/components/custom_stepper.dart';

class RegisterStep2 extends StatefulWidget {
  RegisterStep2({super.key, required this.password, required this.username});

  final password;
  final username;

  @override
  State<RegisterStep2> createState() => _RegisterStep2State();
}

enum Role { peternak, distributor }

class _RegisterStep2State extends State<RegisterStep2> {
  FocusNode focusNode = FocusNode();
  FocusNode ufocusNode = FocusNode();
  Role? role;

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
                    value: Role.peternak,
                    groupValue: role,
                    onChanged: (val) {
                      setState(() {
                        role = val;
                      });
                    },
                    title: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Icon(Icons.factory_rounded),
                          SizedBox(width: 10),
                          Text(
                            'Peternak',
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
                    value: Role.distributor,
                    groupValue: role,
                    onChanged: (val) {
                      setState(() {
                        role = val;
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
                    subtitle: const Text(
                        'Ngetik apa ya jadi distributor adalah benar'),
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterStep3()));
                  },
                  child: const Text('Lanjut'),
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
