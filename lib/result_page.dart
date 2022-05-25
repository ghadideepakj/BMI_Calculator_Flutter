import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation,
      required this.genderSelected,
      required this.ageSelected});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  final String genderSelected;
  final int ageSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              'Your result',
              style: kTitleTextStyle,
            ),
          ),
          Expanded(
              flex: 5,
              child: ReUsableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Gender: $genderSelected',
                          style: kResultBodyStyle,
                        ),
                        Text(
                          'Age: $ageSelected',
                          style: kResultBodyStyle,
                        ),
                      ],
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      style: kResultBodyStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: const Center(
                  child: Text(
                'RE-CALCULATE',
                style: kLargeButton,
              )),
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10.0),
              height: kBottomContainerHeight,
              padding: const EdgeInsets.only(bottom: 20.0),
              decoration: const BoxDecoration(
                color: kBottomContainerColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
