import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'hub_page.dart';
import 'health_news_page.dart';
import 'profile_page.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class LoadingPage extends StatefulWidget {
  static const ldID = 'loading_screen';

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  int _bottomNavIndex = 0;
  final screens = [LandingPage(), HubPage(), NewsPage(), ProfilePage()];
  final List<IconData> icons = [
    Icons.home,
    Icons.person_add,
    Icons.newspaper,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_bottomNavIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        gapWidth: 0.0,
        activeColor: Color(0xFFFE5F55),
        inactiveColor: Color(0xFF4F6367),
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) => setState(() {
          _bottomNavIndex = index;
        }),
      ),
    );
  }
}
