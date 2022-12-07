import 'package:flutter/cupertino.dart';
import 'package:todoey/models/task.dart';

class TasksData extends ChangeNotifier {
  final List<Task> _tasksList = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy bread'),
    Task(name: 'Buy eggs'),
  ];

  operator [](int i) => _tasksList[i];

  void add(Task task) {
    _tasksList.add(task);
    notifyListeners();
  }

  void delete(int index) {
    _tasksList.removeAt(index);
    notifyListeners();
  }

  void toggleDone(int index) {
    _tasksList[index].toggleDone();
    notifyListeners();
  }

  int size() {
    return _tasksList.length;
  }
}
