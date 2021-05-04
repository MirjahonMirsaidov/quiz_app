import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;
  Result(this.totalScore, this.resetHandler);

  String get resultMessage {
    String message;
    if (totalScore >= 20) {
      message = 'You are awesome';
    } else if (totalScore >= 15) {
      message = 'You are good';
    } else {
      message = 'You are ... strange';
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultMessage,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Reset Quiz!'),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
