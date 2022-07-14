import 'package:flutter/material.dart';
import './quiz.dart';
import '../screens/task.dart';


class Qmainclass extends StatefulWidget {
  const Qmainclass({Key? key}) : super(key: key);

  @override
  _QmainclassState createState() => _QmainclassState();
}

class _QmainclassState extends State<Qmainclass> {
  final _questions = const [
    {
      'questionText':
          'Q1. How was your day so far?',
      'answers': [
        {'text': 'Good', 'score': 10},
        {'text': 'Not Good', 'score': 0},
        {'text': 'Okay', 'score': 5},
      ],
    },
    {
      'questionText':
          'Q2. How are you feeling?',
      'answers': [
        {'text': 'Not Good', 'score': 0},
        {'text': 'Good', 'score': 10},
        {'text': 'Neutral', 'score': 5},
      ],
    },
    {
      'questionText':
          ' Q3. Is something/someone bothering you?',
      'answers': [
        {'text': 'Yes', 'score': 5},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText':
          'Q4. How do you feel about yourself?',
      'answers': [
        {'text': 'Good', 'score': 10},
        {'text': 'Netural', 'score': 5},
        {'text': 'Not Good', 'score': 0},
      ],
    },
    {
      'questionText':
          'Q5. Are you feeling better from last time?',
      'answers': [
        {'text': 'Yes', 'score': 10},
        {'text': 'May be', 'score': 5},
        {'text': 'Not Really', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;

  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text('ELEVATE-UP'),
        centerTitle: true,
        elevation: 25,
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizCard(_totalScore)),
                      );
                    },
                    child: const Text('End Test'),
                  ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
