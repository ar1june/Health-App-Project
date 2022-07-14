import 'package:elevate_up_app/home.dart';
import 'package:elevate_up_app/screens/dashboard.dart';
import 'package:elevate_up_app/game/gamepage.dart';
import 'package:elevate_up_app/screens/task.dart';
import 'package:flutter/material.dart';
import 'screens/relax.dart';
import 'screens/task.dart';
import 'screens/dashboard.dart';
import 'screens/help.dart';
import 'home.dart';

class MyDrawer extends StatefulWidget {
  int score;
  int ifYes;
  MyDrawer(this.score, this.ifYes, {Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState(score, ifYes);
}

class _MyDrawerState extends State<MyDrawer> {
  int s;
  int yes;
  _MyDrawerState(this.s, this.yes);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                height: 100,
                child: const Icon(Icons.healing)),
              ),

            TextButton(
                  child: const Text('Tasks'),
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizCard(s)),
                  );
                  },
            ),
            TextButton(
                  child: const Text('Dashoboard'),
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard(s)),
                  );
                  },
            ),
            TextButton(
                  child: const Text('Relax'),
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Relax()),
                  );
                  },
            ),
            TextButton(
                  child: const Text('Game'),
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamePage()),
                  );
                  },
            ),
            TextButton(
                  child: const Text('Help!'),
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Help()),
                  );
                  },
            ),
            TextButton(
                  child: const Text('Home'),
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  );
                  },
            ),

          ],
        ),
    );
  }
}