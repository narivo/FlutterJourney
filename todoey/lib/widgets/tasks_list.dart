import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_data.dart';
import 'task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, taskList, child) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return TaskTile(
              text: taskList[index].name,
              checked: taskList[index].isDone,
              onCheck: (newValue) {
                taskList.toggleDone(index);
              },
              onLongPress: () {
                taskList.delete(index);
              },
            );
          },
          itemCount: taskList.size(),
        );
      },
    );
  }
}
