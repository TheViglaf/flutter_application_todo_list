import 'package:flutter/material.dart';
import 'package:flutter_application_todo_list/utils/todo_dialog.dart';
import 'package:flutter_application_todo_list/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ["Make Tutorial", false],
    ["Flutter Sucks", true]
  ];

  final _dialogController = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return TodoDialog(
              dialogController: _dialogController,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_dialogController.text, false]);
      _dialogController.clear();
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("TO DO"),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.blue[600],
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (p0) => checkBoxChanged(p0, index),
            deleteTask: (p0) => deleteTask(index),
          );
        },
      ),
    );
  }
}
