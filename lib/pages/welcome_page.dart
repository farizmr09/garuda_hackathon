import 'package:garuda_hackathon/pages/login_page.dart';
import 'package:garuda_hackathon/pages/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:garuda_hackathon/custom_widgets/custom_card.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomePage extends StatefulWidget {
  static const String wsID = 'welcome_screen';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Stop your addictions now!',
                      textStyle: TextStyle(
                        fontSize: 29.0,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFFE5F55),
                      ),
                      speed: Duration(milliseconds: 200),
                    ),
                  ],
                  repeatForever: true,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            CustomCard(
              cardColor: Color(0xFF7A9E9F),
              cardText: 'Login',
              onCardPressed: () {
                Navigator.pushNamed(context, LoginPage.lsID);
              },
            ),
            CustomCard(
              cardColor: Color(0xFF4F6367),
              cardText: 'Register',
              onCardPressed: () {
                Navigator.pushNamed(context, RegistrationPage.rsID);
              },
            ),
          ],
        ),
      ),
    );
  }
}
