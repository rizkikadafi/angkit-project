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
    return const CustomScaffold(
      topMarginBody: 120,
      foregroundColor: Colors.white,
      title: Text("Input Batch"),
    );
  }
}
