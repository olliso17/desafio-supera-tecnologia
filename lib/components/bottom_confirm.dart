import 'package:flutter/material.dart';
import 'package:games_app/components/constants.dart';

class BottomConfirm extends StatelessWidget {
  final Function onPressed;
  final Widget textBottom;
  const BottomConfirm({
    this.textBottom,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(height * 0.02),
        ),
        gradient: kLinearGradientBottom,
      ),
      child: Center(
        child: FlatButton(child: textBottom, onPressed: onPressed),
      ),
    );
  }
}
