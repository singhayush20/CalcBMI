import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor; //color of the card
  final Widget? cardChild;
  final void Function()? onPress;
  //Final is used because it tells that the color can't be changed.
  ReusableCard({required this.cardColor, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 200,
        width: 170,
        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: cardColor,
        ),
        child: cardChild,
      ),
    );
  }
}
