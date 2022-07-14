import 'package:flutter/material.dart';
import '../quizs/questionsmain.dart';
import '../quizs/result.dart';
import '../drawer.dart';

class QuizCard extends StatefulWidget {
  int score;
  QuizCard(this.score, {Key? key}) : super(key: key);

  @override
  _QuizCardState createState() => _QuizCardState(score);
}

class _QuizCardState extends State<QuizCard> {
  int s;
  _QuizCardState(this.s);

  bool _isVisible = true;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  static int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int check() {
    if (_counter > 0) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ELEVATE-UP'),
        centerTitle: true,
        elevation: 25,
      ),
      drawer: MyDrawer(s,check()),
      body: Column(
        children: [
          Visibility(
            visible: _isVisible,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Ready to answer a few questions?'),
                      subtitle: Text('It will take a minute or two.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('YES!'),
                          onPressed: () {
                            _incrementCounter();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Qmainclass()),
                            );
                            showToast();
                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('Not Now'),
                          onPressed: showToast,
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: _counter > 0 ? Result(s) : Container())
        ],
      ),
    );
  }
}
