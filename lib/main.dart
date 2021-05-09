import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    setState(() {
      if (quizBrain.end0fQuestion() == false) {
        quizBrain.getQuestionAnswer() == userAnswer
            ? scoreKeeper.add(Icon(
                Icons.check,
                color: Colors.green,
              ))
            : scoreKeeper.add(Icon(
                Icons.close,
                color: Colors.red,
              ));
        quizBrain.nextQuestion();
      } else {
        Alert(
                context: context,
                title: "ALERT",
                desc: "You have finished the quiz")
            .show();
        scoreKeeper.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
              child: Text(
            quizBrain.getQuestionText(),
            style: TextStyle(color: Colors.white, fontSize: 25),
          )),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              child: Text(
                'True',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () => checkAnswer(true),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              child: Text(
                'False',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () => checkAnswer(false),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
