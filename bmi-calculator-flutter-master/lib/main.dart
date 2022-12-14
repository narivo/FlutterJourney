import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff090C22),
        colorScheme: ColorScheme.light(
          primary: const Color(0xff090C22),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => ResultsPage(),
      },
    );
  }
}

// DOCS ////////////////////////////////////////////

/*ThemeData(
  scaffoldBackgroundColor: const Color(0xff090C22),
  colorScheme: ColorScheme.light(
    primary: const Color(0xff090C22),
    secondary: Colors.purple,
    onSecondary: Colors.white,
  ),
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: Colors.white,
    ),
  ),
),*/

/*floatingActionButton: Theme(
  data: ThemeData.light(),
  child: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
),*/
