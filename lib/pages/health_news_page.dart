import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const newsAPI =
    'https://newsapi.org/v2/everything?q=mental-health&from=2022-07-27&sortBy=publishedAt&apiKey=56dbc9c974014ed996a07fbed504e401';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Map<int, Map<String, String>> newsData = {};
  List<NewsCard> newsCard = [];

  void makeCards() {
    for (int i = 0; i < 50; i++) {
      newsCard.add(NewsCard(
        imageURL: newsData[i]!['urlImage'],
        title: newsData[i]!['title'],
        author: newsData[i]!['author'],
      ));
    }
  }

  Future<List<NewsCard>> getNewsData() async {
    var response = await http.get(Uri.parse(newsAPI));
    var responseData;
    if (response.statusCode == 200) {
      String data = response.body;
      responseData = jsonDecode(data);
    } else {
      print(response.statusCode);
    }
    for (int i = 0; i < 50; i++) {
      newsData[i] = {
        'name': responseData['articles'][i]['source']['name'] == null
            ? 'Unknown'
            : responseData['articles'][i]['source']['name'],
        'author': responseData['articles'][i]['author'] == null
            ? 'Unknown'
            : responseData['articles'][i]['author'],
        'title': responseData['articles'][i]['title'] == null
            ? 'Unknown'
            : responseData['articles'][i]['title'],
        'urlImage': responseData['articles'][i]['urlToImage'] == null
            ? 'Unknown'
            : responseData['articles'][i]['urlToImage'],
        'url': responseData['articles'][i]['url'] == null
            ? 'Unknown'
            : responseData['articles'][i]['url'],
      };
      // print(newsData[i]!['author']);
    }
    makeCards();
    return newsCard;
  }

  @override
  void initState() {
    getNewsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
          backgroundColor: Color(0xFFF9FAF9),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child: Text(
                  'Top 50 Articles',
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
                padding: EdgeInsets.only(left: 21.0),
                child: Text(
                  'related to mental health',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFFFE5F55),
                    fontFamily: 'WorkSans-Bold',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Expanded(
                child: FutureBuilder<List<NewsCard>>(
                  future: getNewsData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      final error = snapshot.error;
                      return Text('$error');
                    } else if (snapshot.hasData) {
                      List<NewsCard>? data = snapshot.data;
                      return ListView(
                        children: data!,
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
            ],
          ),
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  NewsCard({required this.imageURL, required this.title, required this.author});

  final String? imageURL;
  final String? title;
  final String? author;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Material(
        elevation: 1,
        child: MaterialButton(
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: ListTile(
              leading: SizedBox(
                width: 50.0,
                height: 50.0,
                child: Image.network(imageURL!),
              ),
              title: Text(
                title!,
                style: TextStyle(
                  color: Color(0xFF4F6367),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '-$author-',
                style: TextStyle(
                  color: Color(0xFFFE5F55),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
