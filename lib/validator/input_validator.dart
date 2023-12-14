import 'package:flutter/material.dart';

FormFieldValidator<String> textValidator = (value) {
  if (value == null || value.isEmpty) {
    return 'This field cannot be empty';
  }
  return null;
};
