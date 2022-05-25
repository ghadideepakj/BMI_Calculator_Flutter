import 'package:flutter/material.dart';

class ReUsableCard extends StatelessWidget {
  ReUsableCard({required this.colour, this.cardChild, this.onPressed});

  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: cardChild,
        //color: const Color(0xFF1D1E33),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            //color: const Color(0xFF1D1E33),
            color: colour,
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
