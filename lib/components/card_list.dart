import 'package:flutter/material.dart';
import 'package:games_app/components/constants.dart';
import 'package:games_app/components/icons_card_button.dart';
import 'package:games_app/components/text_gamer.dart';

class CardList extends StatelessWidget {
  final String image;
  final String textCardName;
  final String textCardScore;
  final String textCardPrice;
  final double addShipping;
  final Widget buttom;
  final Function onPressed;
  final IconData iconData;

  CardList(
      {this.image,
      this.textCardName,
      this.textCardPrice,
      this.textCardScore,
      this.addShipping,
      this.buttom,
      this.onPressed,
      this.iconData});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(height * 0.03),
          ),
          gradient: kGradientCardList,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconsStyle(onPressed: onPressed, iconData: iconData),
            SizedBox(
              height: height * 0.02,
            ),
            TextGamer(
              text: textCardPrice,
              color: kColorTextGamer,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image(
                width: width * 0.6,
                height: height * 0.3,
                fit: BoxFit.fill,
                image: AssetImage(image),
              ),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                TextGamer(
                  text: textCardScore,
                  color: kColorTextGamerScore,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                TextGamer(
                  text: textCardName,
                  color: kColorTextGamerName,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                buttom,
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
