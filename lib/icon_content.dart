import 'package:calcbmi/constants.dart';
import 'package:flutter/cupertino.dart';

class IconContent extends StatelessWidget {
  IconData childIcon;
  String childText;
  IconContent(this.childIcon, this.childText);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          childIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          childText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
