import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
      //       .copyWith(secondary: Colors.redAccent),
      //   textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
      //   appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF141A3C)),
      //   scaffoldBackgroundColor: const Color(0xFF141A3C),
      // ),
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF141A3C)),
          scaffoldBackgroundColor: const Color(0xFF141A3C)),

      home: InputPage(),
    );
  }
}
