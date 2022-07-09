import 'dart:core';

import 'package:flutter/material.dart';

const kInactiveCardColor = Color(0xFF281B54);
const kActiveCardColor = Color(0xFF6A0CDC);

const kAppBarBackgroundColor = 0xFF120041;
const kAppBarShadowColor = 0xFFC3A6D3;
const kScaffoldBackgroundColor = 0xFF120041;
const kElevatedButtonOnPrimaryColor = 0xFF120041;
const kElevatedButtonPrimaryColor = 0xFFFF7043;
const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFFFFFFFF),
);
const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);
const kResultTitleTextStyle = TextStyle(
  fontWeight: FontWeight.w900,
  color: Colors.white,
  fontSize: 30,
);
const kHealthStatusTextStyle = TextStyle(
    color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 22);
const kBMITextStyle =
    TextStyle(fontSize: 80, fontWeight: FontWeight.w900, color: Colors.white);
const kMessageTextStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white70);
const kGenderAgeTextStyle =
    TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18);

enum Gender {
  male,
  female,
  unspecified,
}
