import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_action_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalculatorBrain? calculator =
        ModalRoute.of(context)?.settings.arguments as CalculatorBrain?;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    calculator!.getResult().toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    calculator.getBMI(),
                    style: kBMITextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      calculator.getInterpretation(),
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomActionButton(
            title: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
