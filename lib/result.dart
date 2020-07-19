import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;
  Result(this.totalScore, this.resetQuiz);

  String get resultPhrase {
    print(totalScore);
    var resultText = 'You did it!';
    if(totalScore <= 8) resultText = 'You are awesome and innocent!';
    else if(totalScore <= 12) resultText = 'Pretty Likable!';
    else if (totalScore <= 16) resultText = 'You are...Strange?!';
    else resultText = 'You are very bad!';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase, 
            style: TextStyle(
              fontSize: 36, 
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'), 
            onPressed: () => resetQuiz(),
            textColor: Colors.blue,)
        ] 
      ),
    );
  }
}