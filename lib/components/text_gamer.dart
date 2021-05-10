import 'package:flutter/material.dart';

class TextGamer extends StatelessWidget {
  final String text;
  final Color color;
  TextGamer({
    @required this.color,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: height * 0.035,
            fontWeight: FontWeight.w700,
            color: color),
      ),
    );
  }
}
