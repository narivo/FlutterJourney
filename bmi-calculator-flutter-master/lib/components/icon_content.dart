import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  IconContent({
    this.icon = FontAwesomeIcons.mars,
    this.label = 'MALE',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kLabelTextSize,
        ),
        SizedBox(height: kSpacing),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
