import 'package:flutter/material.dart';
import 'constants.dart';

class iconnText extends StatelessWidget {
  iconnText({required this.iconString, required this.textToShow});
  final IconData iconString;
  final String textToShow;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconString,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          textToShow,
          style: kTextStyleUsed,
        )
      ],
    );
  }
}
