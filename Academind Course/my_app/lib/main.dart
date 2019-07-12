import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var totalScore = 0;

  void answerQuestion(int score) {
    setState(() {
      questionIndex = questionIndex + 1;
      totalScore += score;
    });
    print(totalScore);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color',
        'answers': [
          {'text': 'Black', 'score': 0},
          {'text': 'Blue', 'score': 10},
          {'text': 'Green', 'score': 20},
          {'text': 'White', 'score': 30}
        ]
      },
      {
        'questionText': 'What\'s your favorite animal',
        'answers': [
          {'text': 'Rabbit', 'score': 10},
          {'text': 'Snake', 'score': 0},
          {'text': 'Elephant', 'score': 30},
          {'text': 'Lion', 'score': 5}
        ]
      },
    ];
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Quiz',
            style: (TextStyle(color: Colors.black)),
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: questionIndex < questions.length
              ? Quiz(
                  questions: questions,
                  answerQuestion: answerQuestion,
                  questionIndex: questionIndex)
              : Result()),
    ));
  }
}
