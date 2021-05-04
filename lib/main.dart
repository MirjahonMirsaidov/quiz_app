import 'package:flutter/material.dart';
import 'package:flutter_app/result.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  var questionIndex = 0;
  var totalScore = 0;

  resetEverything() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  var questions = [
    {
      'question': "Most viewed Blackpink song on YouTube?",
      'answers': [
        {'text': 'How you like that', 'score': 0},
        {'text': 'DDU-DU DDU-DU', 'score': 1},
        {'text': 'Kill this love', 'score': 0},
        {'text': 'Boombayah', 'score': 0}
      ]
    },
    {
      'question': "Realese date of first MV?",
      'answers': [
        {'text': 'January 6, 2016', 'score': 0},
        {'text': 'August 8, 2016', 'score': 1},
        {'text': 'February 9, 2017', 'score': 0},
        {'text': 'May 22, 2017', 'score': 0}
      ]
    },
    {
      'question': "What's the name of first single album of Blackpink?",
      'answers': [
        {'text': 'BlackPink in your area', 'score': 0},
        {'text': 'Square One', 'score': 1},
        {'text': 'The Show', 'score': 0},
        {'text': 'Lovesick girls', 'score': 0}
      ]
    }
  ];

  answerQuestion(int answerScore) {
    totalScore += answerScore;
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Blackpink Test App'),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: questions,
              )
            : Result(totalScore, resetEverything),
      ),
    );
  }
}
