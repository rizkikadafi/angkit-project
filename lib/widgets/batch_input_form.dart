import 'package:angkit_project/controller/batch_input_controller.dart';
import 'package:angkit_project/widgets/custom_dropdown.dart';
import 'package:angkit_project/widgets/date_picker.dart';
import 'package:flutter/material.dart';

class BatchInputForm extends StatefulWidget {
  final VoidCallback? onSubmit;

  const BatchInputForm({super.key, this.onSubmit});
  @override
  State<BatchInputForm> createState() => _BatchInputFormState();
}

class _BatchInputFormState extends State<BatchInputForm> {
  BatchInputController controller = BatchInputController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      child: Column(
        children: [
          InputSection(title: "Batch Input", inputs: [
            CustomDropdown(controller: controller),
            const DatePicker(),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onSubmit?.call();
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ])
        ],
      ),
    );
  }
}

class InputSection extends StatelessWidget {
  final String title;
  final List<Widget> inputs;
  const InputSection({super.key, required this.title, required this.inputs});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: const Divider(),
        ),
        Column(
          children: inputs,
        )
      ],
    );
  }
}
