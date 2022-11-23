import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class TaskTile extends StatefulWidget {
  final String text;
  final Function(bool?)? onCheck;

  const TaskTile({super.key, this.text = 'Buy milk', this.onCheck});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.text,
        style: (_checked)
            ? kTodoTextStyle.copyWith(decoration: TextDecoration.lineThrough)
            : kTodoTextStyle,
      ),
      trailing: Checkbox(
        value: _checked,
        activeColor: Colors.lightBlueAccent,
        onChanged: (value) {
          setState(() {
            _checked = value ?? false;
          });
        },
      ),
    );
  }
}
