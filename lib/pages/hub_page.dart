import 'package:flutter/material.dart';
import 'package:garuda_hackathon/pages/chat_page.dart';

class HubPage extends StatefulWidget {
  static const String ID = 'hub_page';

  @override
  State<HubPage> createState() => _HubPageState();
}

class _HubPageState extends State<HubPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF9FAF9),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child: Text(
                  'Chat Hub',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFF4F6367),
                    fontFamily: 'WorkSans-Bold',
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 26.0),
                child: Text(
                  'Talk to other people in need',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFFFE5F55),
                    fontFamily: 'WorkSans-Bold',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(25.0),
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
                                  'Chat Room',
                                  style: TextStyle(
                                    color: Color(0xFF4F6367),
                                    fontFamily: 'WorkSans-Bold',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, ChatPage.csID);
                                  },
                                  icon: Icon(
                                    Icons.arrow_right,
                                    color: Color(0xFFFE5F55),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum egestas, ipsum sit amet tincidunt consectetur, sem velit convallis mi, in sagittis felis dolor sit amet massa. Morbi mollis tortor erat, nec tincidunt felis consectetur porta. '),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                  child: Text(
                    'Topic History',
                    style: TextStyle(
                      color: Color(0xFF4F6367),
                      fontFamily: 'WorkSans-Bold',
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListView(
                    children: [
                      CustomCard(
                        name:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        mood: 'Fariz Muhammad on 28 Augustus 2022',
                      ),
                      CustomCard(
                        name:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        mood: 'Bryan Delton on 25 August 2022',
                      ),
                      CustomCard(
                        name:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        mood: 'Handy Jonarta on 19 August 2022',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({required this.name, required this.mood});

  final String name;
  final String mood;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xFFEEF5DB),
        ),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '$name',
              style: TextStyle(fontSize: 12.0),
            ),
            subtitle: Text(
              '$mood',
              style: TextStyle(fontSize: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}
