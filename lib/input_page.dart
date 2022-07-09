import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ResultsPage.dart';
import 'icon_content.dart';
import 'package:calcbmi/reusable_cart.dart';
import 'constants.dart';
import 'components.dart';
import 'calculator.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.unspecified;
  int height = 100;
  int age = 18;
  double weight = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALC BMI'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /*
          Widget for gender
           */
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(FontAwesomeIcons.mars, "MALE"),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  //Female card
                  child: ReusableCard(
                    cardColor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(FontAwesomeIcons.venus, "FEMALE"),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          /*
          Widget for height
           */
          Expanded(
            child: ReusableCard(
              cardColor: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    /*
                    To match the base line of number and unit, just putting
                    crossAxisAlignment: CrossAxisAlignment.baseline, will break the
                    app. To prevent it, we also set the textBaseline to TextBaseline.alphabetic
                     */
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    //if we don't use of(context), we will have to set each and
                    //every property, context gives the current state of the app and then we can
                    //use the copyWith() to modify the properties of our choice
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.red,
                      activeTrackColor: Colors.blue,
                      inactiveTrackColor: Colors.blueGrey,
                      overlayColor: Color(0x29B71C1C),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 20.0,
                      ),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 10,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 50.0,
                      max: 220.0,
                      //onChanged callback receives the new value
                      onChanged: (double newValue) /*Value passed by slider*/ {
                        /*Use newValue to update the slider using setState() */
                        setState(() {
                          height = newValue.toInt();
                        });
                        print(newValue);
                      },
                      //expects a new value of slider in the onChanged(...)
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                childWidget: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (weight > 1) {
                                      weight--;
                                    }
                                  });
                                }),
                            const SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              childWidget: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                childWidget: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (age > 1) {
                                      age--;
                                    }
                                  });
                                }),
                            const SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              childWidget: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (age < 100) {
                                    age++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            message: 'Calculate BMI',
            onTap: () {
              calculator calc =
                  calculator(height: height, weight: weight.toInt());

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpretation: calc.interpretation(),
                    gender: selectedGender == Gender.male ? 'Male' : 'Female',
                    age: age,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
