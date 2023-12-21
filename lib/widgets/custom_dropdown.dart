import 'package:angkit_project/controller/batch_input_controller.dart';
import 'package:flutter/material.dart';

enum LabelJenisTernak {
  bebek('Bebek'),
  sapi('Sapi');

  const LabelJenisTernak(this.label);
  final String label;
}

class CustomDropdown extends StatelessWidget {
   CustomDropdown({super.key, required this.callback});

   final Function(String) callback;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<LabelJenisTernak>(
      onSelected: (val) {
        callback(val!.label);
      },
      controller: controller,
      label: const Text("Jenis Ternak"),
      requestFocusOnTap: true,
      width: MediaQuery.of(context).size.width * 0.85,
      initialSelection: LabelJenisTernak.bebek,
      dropdownMenuEntries:
          LabelJenisTernak.values.map<DropdownMenuEntry<LabelJenisTernak>>(
        (LabelJenisTernak ternak) {
          return DropdownMenuEntry<LabelJenisTernak>(
            value: ternak,
            label: ternak.label,
          );
        },
      ).toList(),
    );
  }
}
