import 'package:flutter/material.dart';

class CostumYNButton extends StatelessWidget {
  CostumYNButton({required this.yesCondition, required this.noCondition});

  final VoidCallback yesCondition;
  final VoidCallback noCondition;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Material(
              color: Color(0xFFFE5F55),
              elevation: 2,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              child: MaterialButton(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                onPressed: yesCondition,
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Color(0xFFEEF5DB),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Material(
              color: Color(0xFFEEF5DB),
              elevation: 2,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              child: MaterialButton(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                onPressed: noCondition,
                child: Text(
                  'No',
                  style: TextStyle(
                    color: Color(0xFFFE5F55),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
