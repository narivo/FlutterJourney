import 'package:flutter/material.dart';

showSnackbar(context, String message, {MaterialColor? materialColor}) {
  if (message.isEmpty) return;
  // Find the Scaffold in the Widget tree and use it to show a SnackBar
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: materialColor));
}
