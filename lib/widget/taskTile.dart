import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final ValueChanged<bool?> checkBoxCallBack;
  final VoidCallback? onPress;

  TaskTile({this.isChecked = false, this.taskTitle = '', required this.checkBoxCallBack, this.onPress});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: onPress, 
        icon: const Icon(Icons.delete),
        ),
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
            color: Colors.teal),
      ),
      trailing: Checkbox(
        activeColor: Colors.teal,
        value: isChecked,
        onChanged: checkBoxCallBack,
      ),
    );
  }
}
