import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'result_page.dart';
import 'calculator_brain.dart';

enum GenderClicked { male, female }
int height = 180;
int weight = 60;
int age = 20;
String gender = 'Male';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderClicked? selectedGender;

  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = activeCardColor;
  //
  // //Male = 1, female = 0
  // void changeColor(GenderClicked gender) {
  //   maleCardColor == inactiveCardColor
  //       ? maleCardColor == activeCardColor
  //       : maleCardColor = inactiveCardColor;
  //   // if (gender == GenderClicked.male) {
  //   //   maleCardColor = activeCardColor;
  //   //   femaleCardColor = inactiveCardColor;
  //   // } else {
  //   //   maleCardColor = inactiveCardColor;
  //   // }
  //
  //   if (gender == GenderClicked.female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CACULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = 'Male';
                      setState(() {
                        selectedGender = GenderClicked.male;
                      });
                    },
                    child: ReUsableCard(
                      colour: selectedGender == GenderClicked.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: iconnText(
                          iconString: FontAwesomeIcons.mars,
                          textToShow: 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = 'Female';
                      setState(() {
                        selectedGender = GenderClicked.female;
                      });
                    },
                    child: ReUsableCard(
                      colour: selectedGender == GenderClicked.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: iconnText(
                        iconString: FontAwesomeIcons.venus,
                        textToShow: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ReUsableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Height', style: kTextStyleUsed),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kBoldDigits,
                    ),
                    const Text(
                      'cm',
                      style: kTextStyleUsed,
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      //thumbShape:const RoundSliderThumbShape(enabledThumbRadius: 30.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: const Color(0x29EB1555),
                      trackHeight: 1.0),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReUsableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Weight', style: kTextStyleUsed),
                      Text(
                        weight.toString(),
                        style: kBoldDigits,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(
                              child: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundedButton(
                              child: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                ),
                ReUsableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Age',
                        style: kTextStyleUsed,
                      ),
                      Text(
                        age.toString(),
                        style: kBoldDigits,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(
                              child: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundedButton(
                              child: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              await Future.delayed(
                const Duration(seconds: 1),
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                              ageSelected: age,
                              genderSelected: gender,
                            )),
                  );
                },
              );
            },
            child: Container(
              child: const Center(
                  child: Text(
                'CALCULATE',
                style: kLargeButton,
              )),
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10.0),
              height: kBottomContainerHeight,
              padding: const EdgeInsets.only(bottom: 20.0),
              decoration: const BoxDecoration(
                  color: kBottomContainerColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
            ),
          )
        ],
      ),
    );
  }
}
//
// class BottomButton extends StatelessWidget {
//   const BottomButton({required this.buttonTitle, required this.onTap});
//
//   final Function onTap;
//   final String buttonTitle;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap(),
//       child: Container(
//         child: Center(
//             child: Text(
//           buttonTitle,
//           style: kLargeButton,
//         )),
//         width: double.infinity,
//         margin: const EdgeInsets.only(top: 10.0),
//         height: kBottomContainerHeight,
//         padding: const EdgeInsets.only(bottom: 20.0),
//         decoration: const BoxDecoration(
//             color: kBottomContainerColor,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30.0),
//                 topRight: Radius.circular(30.0))),
//       ),
//     );
//   }
// }

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.child, required this.onPressed});

  final IconData child;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPressed,
        child: Icon(child),
        elevation: 6.0,
        constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
        shape: const CircleBorder(),
        fillColor: const Color(0xFF4C4F5E));
  }
}
