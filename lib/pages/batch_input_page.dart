import 'package:angkit_project/widgets/batch_input_form.dart';
import 'package:angkit_project/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class BatchInputPage extends StatefulWidget {
  const BatchInputPage({super.key});

  @override
  State<BatchInputPage> createState() => _BatchInputPageState();
}

class _BatchInputPageState extends State<BatchInputPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      topMarginBody: 150,
      foregroundColor: Colors.white,
      title: const Text("Input Batch"),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
        child: BatchInputForm(
          onSubmit: () {},
        ),
      ),
    );
  }
}
