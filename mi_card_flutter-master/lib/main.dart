import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[700],
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/aincrad.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/kirito_blue.jpg'),
                ),
                Text(
                  "Kirigawa Kazuto",
                  style: TextStyle(
                    fontFamily: 'Permanent Marker',
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "GAME BETA TESTER",
                  style: (TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    color: Colors.blue.shade100,
                  )),
                ),
                SizedBox(
                  height: 20.0,
                  child: Divider(
                    color: Colors.blue.shade100,
                  ),
                ),
                Card(
                  color: Colors.blue.shade50,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.phone, color: Colors.blue.shade900),
                    title: Text(
                      '+44 123 456 789',
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0),
                    ),
                  ),
                ),
                Card(
                    color: Colors.blue.shade50,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(Icons.mail, color: Colors.blue.shade900),
                      title: Text(
                        'theseed@aincrad.com',
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
