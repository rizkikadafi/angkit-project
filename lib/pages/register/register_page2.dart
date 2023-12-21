import 'package:angkit_project/controller/register_controller.dart';
import 'package:angkit_project/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flash/flash.dart';

class RegisterPage2 extends StatefulWidget {

  const RegisterPage2({super.key});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
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
                    groupValue: RegisterController.role,
                    onChanged: (val) {
                      setState(() {
                        RegisterController().updateRole(val as String);
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
                    groupValue: RegisterController.role,
                    onChanged: (val) {
                      setState(() {
                        RegisterController().updateRole(val as String);
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
                  onPressed: () {
                    RegisterController().registRole().then((value) {
                      if (value) {
                        Navigator.of(context).pushReplacementNamed(
                          '/registerPage3',
                        );
                      } else {
                        showFlash(
                          context: context,
                          duration: const Duration(seconds: 3),
                          builder: (context, controller) {
                            return FlashBar (
                              controller: controller,
                              content: const Text('Harap pilih peran anda!'),
                              backgroundColor: Theme.of(context).colorScheme.secondary,
                              position: FlashPosition.top,
                            );
                          },
                        );
                      }
                    });
                  },
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
