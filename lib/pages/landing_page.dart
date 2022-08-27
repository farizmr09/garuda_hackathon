import 'package:flutter/material.dart';
import 'package:garuda_hackathon/custom_widgets/custom_user_card.dart';
import 'package:garuda_hackathon/custom_widgets/checkup_text.dart';
import 'package:garuda_hackathon/custom_widgets/custom_yn_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _auth = FirebaseAuth.instance;
User? currentUser;

class LandingPage extends StatefulWidget {
  static const String ID = 'landing_page';

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _streak = 0;
  bool _answered = false;
  final now = DateTime.now();
  late Future<Map<String, String>> data;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        currentUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _loadAnswer() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _answered = (prefs.getBool('answer') ?? false);
    });
  }

  Future<void> _complementAnswer() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _answered = true;
      prefs.setBool('answer', _answered);
    });
  }

  Future<void> _loadStreak() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _streak = (prefs.getInt('streak') ?? 0);
    });
  }

  Future<void> _incrementStreak() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _streak = (prefs.getInt('streak') ?? 0) + 1;
      prefs.setInt('streak', _streak);
    });
  }

  Future<void> _resetStreak() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _streak = 0;
      prefs.setInt('streak', _streak);
    });
  }

  Future<Map<String, String>> getRequest() async {
    Map<String, String> jsonItems;
    var response = await http.get(Uri.parse(
        'https://zenquotes.io/api/today/ab40fbb4af014130de52a6b0e3b7e2a980d1a12'));
    if (response.statusCode == 200) {
      String data = response.body;
      var responseData = jsonDecode(data);
      jsonItems = {
        'q': responseData[0]['q'],
        'a': responseData[0]['a'],
      };
      return jsonItems;
    } else {
      print(response.statusCode);
    }
    throw 'Failed';
  }

  @override
  void initState() {
    super.initState();
    data = getRequest();
    _loadAnswer();
    _loadStreak();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 20.0, top: 20.0, right: 20.0, bottom: 10.0),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: CustomUserCard(
                    streak: _streak,
                    user: currentUser?.email.toString(),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Quote of the day',
                                  style: TextStyle(
                                    color: Color(0xFF4F6367),
                                    fontFamily: 'WorkSans-Bold',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.format_quote,
                                    color: Color(0xFFFE5F55),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                child: FutureBuilder<Map<String, String>?>(
                                  future: data,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      final error = snapshot.error;
                                      return Text('$error');
                                    } else if (snapshot.hasData) {
                                      Map<String, String>? data = snapshot.data;
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('"${data!['q']}"'),
                                          Text('-${data['a']}-'),
                                        ],
                                      );
                                    } else {
                                      return Center(
                                        child: const CircularProgressIndicator(
                                          color: Color(0xFFFE5F55),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: CheckupText(answered: _answered, now: now),
              ),
              !_answered && now.hour >= 19
                  ? CostumYNButton(
                      yesCondition: () {
                        setState(() {
                          _complementAnswer();
                          _incrementStreak();
                        });
                      },
                      noCondition: () {
                        setState(() {
                          _complementAnswer();
                          _resetStreak();
                        });
                      },
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 28.0),
                      child: Text(
                        'Check again after 7:00 PM',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

// Text(
// '"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum egestas, ipsum sit amet tincidunt consectetur, sem velit convallis mi, in sagittis felis dolor sit amet massa. Morbi mollis tortor erat, nec tincidunt felis consectetur porta."'),
