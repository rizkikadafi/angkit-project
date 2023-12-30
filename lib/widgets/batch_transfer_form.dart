import 'package:angkit_project/controller/batch_input_controller.dart';
import 'package:angkit_project/validator/input_validator.dart';
import 'package:angkit_project/widgets/batch_input_form.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BatchTransferForm extends StatefulWidget {
  const BatchTransferForm({super.key});

  @override
  State<BatchTransferForm> createState() => _BatchTransferFormState();
}

class _BatchTransferFormState extends State<BatchTransferForm> {
  final formKey = GlobalKey<FormState>();

  TextEditingController batchId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: InputSection(
          title: "Batch dari peternak",
          inputs: [
            Text(
              "ID batch",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 5),
            TextFormField(
              validator: emptyValidator,
              controller: batchId,
              decoration: const InputDecoration(
                labelText: 'Contoh: ji42E1',
              ),
            ),
            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    String res = await BatchInputController.distributorAddBatch(batchId.text);
                    if (res == 'Success add batch') {
                      Fluttertoast.showToast(msg: res);
                      if (!mounted) return;
                      Navigator.pop(context);
                    } else {
                      Fluttertoast.showToast(msg: res);
                    }
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
