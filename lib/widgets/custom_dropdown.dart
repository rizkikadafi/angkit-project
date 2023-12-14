import 'package:angkit_project/controller/batch_input_controller.dart';
import 'package:flutter/material.dart';

enum LabelJenisTernak {
  bebek('Bebek'),
  sapi('Sapi');

  const LabelJenisTernak(this.label);
  final String label;
}

class CustomDropdown extends StatefulWidget {
  final BatchInputController controller;
  const CustomDropdown({super.key, required this.controller});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<LabelJenisTernak>(
      label: const Text("Jenis Ternak"),
      requestFocusOnTap: true,
      inputDecorationTheme: const InputDecorationTheme(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
          )
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      initialSelection: LabelJenisTernak.bebek,
      controller: widget.controller.jenisTernak,
      dropdownMenuEntries: LabelJenisTernak.values
          .map<DropdownMenuEntry<LabelJenisTernak>>((LabelJenisTernak ternak) {
        return DropdownMenuEntry<LabelJenisTernak>(
          value: ternak,
          label: ternak.label,
        );
      }).toList(),
    );
  }
}
