import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomActionButton extends StatelessWidget {
  final Function() onTap;
  final String title;

  BottomActionButton({required this.onTap, this.title = 'CALCULATE'});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            title,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
