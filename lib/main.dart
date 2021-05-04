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
      'question': "What's your favourite color?",
      'answers': [
        {'text': 'Black', 'score': 9},
        {'text': 'White', 'score': 8},
        {'text': 'Red', 'score': 5},
        {'text': 'Pink', 'score': 5}
      ]
    },
    {
      'question': "What's your favourite animal?",
      'answers': [
        {'text': 'Dog', 'score': 9},
        {'text': 'Cat', 'score': 8},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Cow', 'score': 5}
      ]
    },
    {
      'question': "What's your favourite musician?",
      'answers': [
        {'text': 'BlackPink', 'score': 9},
        {'text': 'Justin Bieber', 'score': 8},
        {'text': 'Taylor Swift', 'score': 5},
        {'text': 'Drake', 'score': 5}
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
          title: Text('My First App'),
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
