import 'package:flutter/cupertino.dart';

class Task {
  final String name;
  bool isDone;

  Task({this.name = 'Buy eggs', this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
