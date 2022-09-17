import 'package:flutter/material.dart';
import 'package:todoey/screens/addTask_screen.dart';
import 'package:todoey/widget/taskTile.dart';
import 'package:todoey/widget/taskList.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  String? newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTask());
        },
        backgroundColor: Colors.teal,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 50.0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              right: 30.0,
              left: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 40.0,
                    color: Colors.teal,
                  ),
                  radius: 30.0,
                  backgroundColor: Colors.white,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} tasks',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
