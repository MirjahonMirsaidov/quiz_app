import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;
  Result(this.totalScore, this.resetHandler);

  String get resultMessage {
    String message;
    if (totalScore == 3) {
      message = 'You are awesome';
    } else if (totalScore == 2) {
      message = 'New fan?';
    } else {
      message = 'You still think you are a blink?';
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
          OutlinedButton(
            onPressed: resetHandler,
            child: Text('Reset Quiz!'),
          )
        ],
      ),
    );
  }
}
