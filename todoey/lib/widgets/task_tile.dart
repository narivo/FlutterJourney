import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class TaskTile extends StatelessWidget {
  final String text;
  final bool checked;
  final Function(bool?) onCheck;
  final Function()? onLongPress;

  const TaskTile({
    super.key,
    this.text = 'Buy milk',
    this.checked = false,
    required this.onCheck,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: ListTile(
        title: Text(
          text,
          style: (checked)
              ? kTodoTextStyle.copyWith(decoration: TextDecoration.lineThrough)
              : kTodoTextStyle,
        ),
        trailing: Checkbox(
          value: checked,
          activeColor: Colors.lightBlueAccent,
          onChanged: onCheck,
        ),
      ),
    );
  }
}
