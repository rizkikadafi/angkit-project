import 'package:angkit_project/widgets/batch_input_form.dart';
import 'package:angkit_project/widgets/batch_transfer_form.dart';
import 'package:angkit_project/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BatchInputPage extends StatefulWidget {
  const BatchInputPage({super.key});

  @override
  State<BatchInputPage> createState() => _BatchInputPageState();
}

class _BatchInputPageState extends State<BatchInputPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      topMarginBody: 120,
      foregroundColor: Colors.white,
      title: const Text("Input Batch"),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
        // child: BatchInputForm(
        //   onSubmit: () {},
        // ),
        // child: BatchTransferForm(),
        child: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData){
                String role = snapshot.data!.getString('role')!;
                if (role == 'Peternakan') {
                  return BatchInputForm();
                } else {
                  return const BatchTransferForm();
                }
              }
              return Container();
            }
            return Container();

          },
        ),
      ),
    );
  }
}
