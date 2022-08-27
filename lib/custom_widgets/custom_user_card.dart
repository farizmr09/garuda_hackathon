import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({
    Key? key,
    required this.streak,
    required this.user,
  }) : super(key: key);

  final int streak;
  final String? user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Welcome,',
                  style: TextStyle(
                    color: Color(0xFF4F6367),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  '$user',
                  style: TextStyle(
                    color: Color(0xFFFE5F55),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              '$streak',
              style: TextStyle(
                color: Color(0xFF4F6367),
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            IconButton(
              splashColor: Color(0),
              highlightColor: Color(0),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(0),
              onPressed: () {
                print(streak);
              },
              icon: new Icon(
                MdiIcons.fire,
                color: Color(0xFFFE5F55),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
