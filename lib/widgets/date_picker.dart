import 'package:angkit_project/controller/batch_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../validator/input_validator.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, required this.callback, this.initDate = ''});

  final Function(String) callback;
  final String initDate;


  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.initDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: emptyValidator,
      decoration: const InputDecoration(
        label: Text('Tekan untuk pilih tanggal'),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          setState(() {
            controller.text = formattedDate;
          });
          widget.callback(formattedDate);
        } else {}
      },
    );
  }
}
