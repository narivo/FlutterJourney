import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("I Am Rich"),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.blueGrey,
      body: const Center(
        child: Image(
          image: NetworkImage('https://www.w3schools.com/css/img_lights.jpg'),
        ),
      ),
    ),
  ));
}
