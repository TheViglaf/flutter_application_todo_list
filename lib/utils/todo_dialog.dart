import 'package:flutter/material.dart';
import 'package:flutter_application_todo_list/utils/todo_buttons.dart';

// ignore: must_be_immutable
class TodoDialog extends StatelessWidget {
  final dialogController;
  VoidCallback onSave;
  VoidCallback onCancel;

  TodoDialog(
      {super.key,
      required this.dialogController,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: dialogController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "add a task"),
            ),
            Row(
              children: [
                TodoButton(buttonText: "Save", onPressedCallback: onSave),
                TodoButton(buttonText: "Exit", onPressedCallback: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
