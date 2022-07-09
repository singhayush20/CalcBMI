import 'dart:math';

class calculator {
  calculator({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    //Convert double to single deciaml place
    return _bmi.toStringAsFixed(2);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else
      return 'Underweight';
  }

  String interpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal weight! You need to exercise more!';
    } else if (_bmi > 18.5) {
      return 'You have a normal weight! Keep exercising and stay healthy!';
    } else {
      return 'You have a less than normal weight! You can eat a bit more!';
    }
  }
}
