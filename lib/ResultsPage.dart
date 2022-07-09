import 'package:calcbmi/components.dart';
import 'package:calcbmi/reusable_cart.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'calculator.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  final String gender;
  final int age;
  ResultsPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation,
      required this.gender,
      required this.age});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALC BMI'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Text(
              'Result',
              style: kResultTitleTextStyle,
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColor: Color(0x60575A62),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Gender: $gender',
                        style: kGenderAgeTextStyle,
                      ),
                      Text('Age: $age', style: kGenderAgeTextStyle),
                    ],
                  ),
                  Text(
                    resultText,
                    style: kHealthStatusTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      interpretation,
                      style: kMessageTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            message: 'Recalculate BMI',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
