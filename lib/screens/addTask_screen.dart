import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widget/taskTile.dart';
import 'package:provider/provider.dart';

class AddTask extends StatefulWidget {
  final ValueChanged<String>? addNewTaskTitle;
  AddTask({this.addNewTaskTitle});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String newTaskTitle = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
      ),
      padding: const EdgeInsets.all(35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25.0, color: Colors.teal),
          ),
          TextField(
            onChanged: (value) {
              newTaskTitle = value;
            },
            style: TextStyle(color: Colors.teal),
            //autofocus: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Add the tasks',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
              Navigator.pop(context);
            },
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.teal)),
          ),
        ],
      ),
    );
  }
}
