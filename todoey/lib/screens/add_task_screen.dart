import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(String) onAddTask;

  const AddTaskScreen({super.key, required this.onAddTask});

  @override
  Widget build(BuildContext context) {
    String taskName = '';

    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                autofocus: true,
                onChanged: (value) {
                  taskName = value;
                },
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: kInputBorder,
                  enabledBorder: kInputBorder,
                  focusedBorder: kInputBorder,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () {
                  onAddTask(taskName);
                },
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
