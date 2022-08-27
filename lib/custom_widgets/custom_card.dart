import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {required this.cardColor, required this.cardText, this.onCardPressed});

  final Color cardColor;
  final String cardText;
  final VoidCallback? onCardPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: cardColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onCardPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            cardText,
            style: TextStyle(color: Color(0xFFEEF5DB)),
          ),
        ),
      ),
    );
  }
}
