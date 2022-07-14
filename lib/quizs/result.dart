import 'package:flutter/material.dart';
import '../screens/dashboard.dart';

class Result extends StatelessWidget {
  final int resultScore;

  const Result(this.resultScore, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (resultScore >= 45)
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.album),
                        title: Text(
                          'Set attainable goals',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            'Slow and steady wins the race! Little by little you will also attain your goals.'),
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(width: 8),
                        TextButton(
                          child: const Text('Done'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard(1)),
                            );
                          },
                        ),
                        SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              if (resultScore >= 30)
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.album),
                        title: Text(
                          'Reward yourself',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            'An Ice-cream or a choclate, get something for yourself and be proud of your accomplishmnets'),
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(width: 8),
                        TextButton(
                          child: const Text('Done'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard(1)),
                            );
                          },
                        ),
                        SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              if (resultScore >= 20 && resultScore < 40)
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.album),
                        title: Text(
                          'Do something you love',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            'Tune yourself to work and music and get lost in your own happy place.'),
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(width: 8),
                        TextButton(
                          child: const Text('Done'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard(1)),
                            );
                          },
                        ),
                        SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              if (resultScore >= 10 && resultScore < 30)
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.album),
                        title: Text(
                          'Meditate and Relax',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            'Relax with nature or put the sound on and meditate for a minute or two, get your mind blank and forget everything else.'),
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(width: 8),
                        TextButton(
                          child: const Text('Done'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard(1)),
                            );
                          },
                        ),
                        SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              if (resultScore >= 0 && resultScore < 20)
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.album),
                        title: Text(
                          'Have a ME time with App',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            'Spend some time playing game in the app, relaxing with nature sound or having a conversation if needed in the help section. '),
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(width: 8),
                        TextButton(
                          child: const Text('Done'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard(1)),
                            );
                          },
                        ),
                        SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
