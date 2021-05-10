import 'package:flutter/material.dart';
import 'package:games_app/components/constants.dart';

class IconsStyle extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;
  IconsStyle({
    @required this.iconData,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.05,
      child: IconButton(
          alignment: Alignment.topRight,
          color: kIconColor,
          icon: Icon(
            iconData,
            size: height * 0.05,
          ),
          onPressed: onPressed),
    );
  }
}
