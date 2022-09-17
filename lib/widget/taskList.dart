import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widget/taskTile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks.dart';

class TaskList extends StatefulWidget {
  //final List<Task>? task;
  //TaskList({this.tasks});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  TaskData taskData = TaskData();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, value, child) {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return TaskTile(
            taskTitle: Provider.of<TaskData>(context).tasks[index].name,
            isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
            checkBoxCallBack: (checkBox) {
              setState(() {
                taskData.updateTask(
                    Provider.of<TaskData>(context, listen: false).tasks[index]);
              });
            },
            onPress: () {
              setState(() {
                Provider.of<TaskData>(context, listen: false).deleteTask();
              });
            },
          );
        }),
        itemCount: Provider.of<TaskData>(context).taskCount,
      );
    }));
  }
}
