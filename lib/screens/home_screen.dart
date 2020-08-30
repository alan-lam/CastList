import 'dart:convert';

import 'package:castlist/ServerService.dart';
import 'package:castlist/components/episode_pill.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  final String firstName;

  HomeScreen({this.firstName});

  @override
  _HomeScreenState createState() => _HomeScreenState(firstName: firstName);
}

class _HomeScreenState extends State<HomeScreen> {
  String firstName;
  dynamic episodes = [];

  _HomeScreenState({this.firstName});

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getEpisodes();
  }

  void getCurrentUser() {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (firstName == '') {
        firstName = user.displayName;
      } else {
        user.updateProfile(displayName: firstName);
      }
    } catch (e) {
      print(e);
    }
  }

  void getEpisodes() async {
    dynamic results = await ServerService().recommendedEpisodes;
    setState(() {
      episodes = jsonDecode(results)['recommendedEpisodes'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: TextStyle(
                  fontSize: 45.0,
                ),
              ),
              Text(
                firstName,
                style: TextStyle(
                  fontSize: 45.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: () {
                          print('hi');
                        },
                        child: Text('Favorites'),
                        color: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: () {
                          print('hi');
                        },
                        child: Text('Recommended'),
                        color: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: () {
                          print('hi');
                        },
                        child: Text('Politics'),
                        color: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: () {
                          print('hi');
                        },
                        child: Text('News'),
                        color: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: () {
                          print('hi');
                        },
                        child: Text('A Category'),
                        color: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: FlatButton(
                        onPressed: () {
                          print('hi');
                        },
                        child: Text('Another One'),
                        color: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    List<String> duration =
                        episodes[index]['duration'].split(":");
                    int hours = int.parse(duration[0]);
                    int minutes = int.parse(duration[1]);
                    String displayMinutes = (hours * 60 + minutes).toString();
                    return EpisodePill(
                      imageURL: episodes[index]['showImageURL'],
                      episodeTitle: episodes[index]['episodeTitle'],
                      description: episodes[index]['description'],
                      duration: displayMinutes,
                    );
                  },
                  itemCount: episodes.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
