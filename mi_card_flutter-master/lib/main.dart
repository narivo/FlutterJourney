import 'package:flutter/material.dart';

void main() {
  runApp(const ChallengeApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 100.0, color: Colors.white, child: Text('Containee 1')),
            SizedBox(
              //height: 20.0
              width: 20.0,
            ),
            Container(
                height: 100.0, color: Colors.blue, child: Text('Container 2')),
            Container(
                height: 100.0, color: Colors.red, child: Text('Container 3')),
            /*Container(
              height: 100.0,
              width: double.infinity,
            ),*/
          ],
        )),
      ),
    );
  }
}

class ChallengeApp extends StatelessWidget {
  const ChallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 100.0,
                        height: 100.0,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.blue,
                ),
              ]),
        ),
      ),
    );
  }
}
