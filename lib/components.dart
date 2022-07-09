import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({Key? key, required this.message, required this.onTap})
      : super(key: key);
  final String message;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      height: 50,
      width: 60,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(message),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData? childWidget;
  /*
  If we use Function? for onPressed error occurs-
  onPressed: onPressed, //
   */
  final VoidCallback? onPressed;
  RoundIconButton({@required this.childWidget, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: const CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 20, //elevation will not appear
      splashColor: Colors.blueGrey,

      onPressed: onPressed,
      child: Icon(childWidget),
    );
  }
}
