import 'package:flutter/material.dart';

FormFieldValidator<String> textValidator = (value) {
  if (value == null || value.isEmpty) {
    return 'This field cannot be empty';
  }
  return null;
};

FormFieldValidator<String> passwordValidator = (value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  return null;
};

FormFieldValidator<String> emptyValidator = (value) {
  if (value == null || value.isEmpty) {
    return 'This field can\'t be empty';
  }
  return null;
};

