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
  bool? _checked = false;

  void checkboxCallback(bool? checkboxState) {
    setState(() {
      _checked = checkboxState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.text,
        style: (_checked ?? false)
            ? kTodoTextStyle.copyWith(decoration: TextDecoration.lineThrough)
            : kTodoTextStyle,
      ),
      trailing: TaskCheckbox(
        checked: _checked ?? false,
        toggleCheckboxState: checkboxCallback,
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool checked;
  final Function(bool?)? toggleCheckboxState;

  const TaskCheckbox(
      {super.key, this.checked = false, this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checked,
      activeColor: Colors.lightBlueAccent,
      onChanged: toggleCheckboxState,
    );
  }
}
