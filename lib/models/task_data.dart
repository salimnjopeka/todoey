import 'package:flutter/foundation.dart';
import 'package:todoey/models/tasks.dart';
import 'package:provider/provider.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Go to School'),
    Task(name: 'Check this one'),
  ];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }
  

  int get taskCount {
    return tasks.length;
  }

  void addTask(newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.checkDone();
    notifyListeners();
  }

  void deleteTask() {
    _tasks.clear();
    notifyListeners();
  }
}
