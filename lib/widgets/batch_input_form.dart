import 'dart:io';

import 'package:angkit_project/controller/batch_input_controller.dart';
import 'package:angkit_project/pages/camera_page.dart';
import 'package:angkit_project/validator/input_validator.dart';
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
  final formKey = GlobalKey<FormState>();
  File image = File('');
  final nama = TextEditingController();
  final spesies = TextEditingController();
  var jenisTernak = '';
  var tanggalMulai = '';

  Future<void> _getPhoto(BuildContext context) async {
    String photo = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CameraPage(),
      ),
    );
    if (!mounted) return;
    setState(() {
      image = File(photo);
    });
  }

  void onTap (context) async {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(27),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
              CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(ctx);
                    await _getPhoto(ctx);
                  },
                  child: const Text('Take from camera'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result =
                    await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: [
                        'jpg',
                        'png',
                        'jpeg'
                      ],
                    );
                    if (!mounted) return;
                    if (result != null) {
                      setState(() {
                        image = File(
                          result.files.single.path!,
                        );
                      });
                    }
                    Navigator.pop(ctx);
                    // await _pickPhoto();
                  },
                  child: const Text('Select from gallery'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    nama.dispose();
    spesies.dispose();
    super.dispose();
  }

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
                Text(
                  "Nama batch",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                TextFormField(
                  validator: emptyValidator,
                  controller: nama,
                  decoration: const InputDecoration(
                    labelText: 'Contoh: Batch 123 Farm 1',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Jenis Ternak",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                CustomDropdown(
                  callback: (val) {
                      jenisTernak = val;
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  "Spesies",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                TextFormField(
                  validator: emptyValidator,
                  controller: spesies,
                  decoration: const InputDecoration(
                    labelText: 'Contoh: Sapi Jawa',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Tanggal Mulai",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                DatePicker(
                  callback: (val) {
                    tanggalMulai = val;
                  },
                ),
                const SizedBox(height: 15),
                Text(
                  "Batch photo",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Selected image:"),
                          image.path.split('/').last != ''
                              ? InkWell(
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
                                )
                              : Text("None"),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => onTap(context),
                      child: const Text("Select image"),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (image.path == '') {
                          Fluttertoast.showToast(
                            msg: 'Foto harus dipilih',
                            backgroundColor: Colors.red,
                          );
                          return;
                        }
                        widget.onSubmit?.call();
                        BatchInputController.sendData(
                          image,
                          context,
                          jenisTernak,
                          tanggalMulai,
                          nama.text,
                          spesies.text,
                        );
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
