import 'package:flutter/material.dart';

class CheckupText extends StatelessWidget {
  const CheckupText({
    Key? key,
    required this.answered,
    required this.now,
  }) : super(key: key);

  final bool answered;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 25.0, right: 25.0, top: 30.0, bottom: 10.0),
      child: !answered && now.hour >= 19
          ? Text(
              'Did you manage to avoid your addiction today?',
              style: TextStyle(
                color: Color(0xFF4F6367),
                fontFamily: 'WorkSans-Bold',
                fontSize: 20,
                fontWeight: FontWeight.w800,
                letterSpacing: 2.0,
              ),
            )
          : Text(
              'Daily checkup isn\'t available!',
              style: TextStyle(
                color: Color(0xFF4F6367),
                fontFamily: 'WorkSans-Bold',
                fontSize: 20,
                fontWeight: FontWeight.w800,
                letterSpacing: 2.0,
              ),
            ),
    );
  }
}
