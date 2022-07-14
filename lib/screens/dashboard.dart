import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../drawer.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class Dashboard extends StatefulWidget {
  int score;
  Dashboard(this.score, {Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState(score);
}

class _DashboardState extends State<Dashboard> {
  int s;
  _DashboardState(this.s);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ELEVATE-UP'),
          centerTitle: true,
          elevation: 25,
        ),
        drawer: MyDrawer(s,1),
        body: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    ProfilePicture(
                      name: 'Kishu',
                      radius: 40,
                      fontsize: 21,
                      
                      ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text( 'KISHU',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text( 'Level -1 ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          LinearProgressIndicator(
                            value: 0.25,
                            minHeight: 20,
                            semanticsLabel: 'Linear progress indicator',
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text( 'Earn as you HEAL',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Row(
                          children: const[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child : Icon(Icons.music_note )
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child : Icon(Icons.gamepad )
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child : Icon(Icons.favorite )
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child : Icon(Icons.extension )
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child : Icon(Icons.face )
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child : Icon(Icons.ac_unit )
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child : Icon(Icons.android )
                            ),

                          ],
                        )
                      ],
                      
                      
                    ),
                  ],
                ),
        );
  }}
