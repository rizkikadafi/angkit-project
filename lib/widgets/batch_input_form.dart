import 'dart:io';

import 'package:angkit_project/controller/batch_input_controller.dart';
import 'package:angkit_project/widgets/custom_dropdown.dart';
import 'package:angkit_project/widgets/date_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BatchInputForm extends StatefulWidget {
  final VoidCallback? onSubmit;

  const BatchInputForm({super.key, this.onSubmit});
  @override
  State<BatchInputForm> createState() => _BatchInputFormState();
}

class _BatchInputFormState extends State<BatchInputForm> {
  // BatchInputController controller = BatchInputController;
  final formKey = GlobalKey<FormState>();
  File image = File('');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            InputSection(
              title: "Batch Info",
              inputs: [
                TextFormField(
                  controller: BatchInputController.nama,
                  decoration: const InputDecoration(
                    labelText: 'Nama batch',
                  ),
                ),
                const CustomDropdown(),
                TextFormField(
                  controller: BatchInputController.spesies,
                  decoration: const InputDecoration(
                    labelText: 'Spesies',
                  ),
                ),
                const DatePicker(),
                const SizedBox(height: 15),
                Text(
                  "Batch photo",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'png', 'jpeg'],
                        );
                        if (result != null) {
                          setState(() {
                            image = File(result.files.single.path!);
                          });
                        }
                      },
                      child: const Text("Select image"),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("Selected image:"),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return Dialog(
                                    child: Image.file(image),
                                    // child: Image.asset('assets/img/no-image.png'),
                                  );
                                },
                                barrierDismissible: true,
                              );
                            },
                            child: Text(
                              image.path.split('/').last,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      // if (image.path == '') {
                      //   Fluttertoast.showToast(
                      //     msg: 'Foto harus dipilih',
                      //     backgroundColor: Colors.red,
                      //   );
                      // }
                      if (formKey.currentState!.validate()) {
                        widget.onSubmit?.call();
                        BatchInputController.sendData(image);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            )
          ],
        ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5),
          child: Divider(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: inputs,
        )
      ],
    );
  }
}
