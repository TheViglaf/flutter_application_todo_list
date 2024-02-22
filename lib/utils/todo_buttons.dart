import 'package:flutter/material.dart';

class TodoButton extends StatelessWidget {
  final String buttonText;
  VoidCallback onPressedCallback;

  TodoButton(
      {super.key, required this.buttonText, required this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressedCallback,
      color: Colors.grey,
      child: Text(buttonText),
    );
  }
}
