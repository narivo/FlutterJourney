import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Animaniacs'),
      ),
      body: const Center(
        child: Image(
          image: AssetImage("images/juicy-girl.png"),
        ),
      ),
    ),
  ));
}
