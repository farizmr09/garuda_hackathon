import 'package:garuda_hackathon/pages/chat_page.dart';
import 'package:garuda_hackathon/pages/login_page.dart';
import 'package:garuda_hackathon/pages/registration_page.dart';
import 'package:garuda_hackathon/pages/welcome_page.dart';
import 'package:garuda_hackathon/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MentalHelp());
}

class MentalHelp extends StatefulWidget {
  const MentalHelp({Key? key}) : super(key: key);

  @override
  State<MentalHelp> createState() => _MentalHelpState();
}

class _MentalHelpState extends State<MentalHelp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
      routes: {
        WelcomePage.wsID: (context) => WelcomePage(),
        LoginPage.lsID: (context) => LoginPage(),
        RegistrationPage.rsID: (context) => RegistrationPage(),
        ChatPage.csID: (context) => ChatPage(),
        LoadingPage.ldID: (context) => LoadingPage(),
      },
    );
  }
}
