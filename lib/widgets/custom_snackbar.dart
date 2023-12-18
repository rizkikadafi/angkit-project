import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  final String message;
  final Duration? duration;
  const CustomSnackbar({super.key, required this.message, this.duration});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      behavior: SnackBarBehavior.floating,
    );
  }
}
