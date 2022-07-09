import 'package:calcbmi/constants.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  BMICalculator({Key? key}) : super(key: key);
  final ThemeData theme = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: ThemeData.dark(), //default dark theme
      theme: theme.copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(kAppBarBackgroundColor),
          shadowColor: Color(kAppBarShadowColor),
          elevation: 15,
        ),
        scaffoldBackgroundColor: Color(kScaffoldBackgroundColor),
        // textTheme: TextTheme(
        //   bodyText1: TextStyle(
        //     color: Colors.white,
        //   ),
        // ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(kElevatedButtonPrimaryColor),
            onPrimary: Color(kElevatedButtonOnPrimaryColor),
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200),
            ),
          ),
        ),
        //Color given to major parts of the app like toolbars, tab bars, etc
        colorScheme: theme.colorScheme.copyWith(
            // primary: Color(0xFF120041), //color of appbar -WON'T WORK
            // secondary: Color(0xFFA75450), //color of fab icon -WON'T WORK
            ),
      ),
      // themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}
