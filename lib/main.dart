import 'package:flutter/material.dart';

import './quize.dart';
import './result.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  
  final _questions = const [
    {
      'question': 'What\'s Your favorite color?',
      'options': [
        {'text':'Red', 'score':10},
        {'text':'Green', 'score': 4},
        {'text':'Purple', 'score': 1}
      ]
    }, 
    {
      'question': 'What\'s Your favorite animal?',
      'options': [
        {'text':'Lion', 'score': 3},
        {'text':'Tiger', 'score': 7},
        {'text': 'Dog', 'score': 1}
      ]
    }, 
    {
      'question': 'What\'s Your favorite car?',
      'options': [
        {'text':'Tesla', 'score': 1},
        {'text':'Corvet', 'score': 4},
        {'text':'Mclaren', 'score': 9}
      ]
    }
  ];
  var _questionIndex = 0;
  int _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    if(_questionIndex < _questions.length){
      this.setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
    
  }
  void _resetQuiz(){
    this.setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  @override
  Widget build(BuildContext context){
    // print(questionIndex);
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My first app'),),
      body: _questionIndex < _questions.length ? 
      Quiz(
        answerQuestion: _answerQuestion, 
        questions: _questions, 
        questionIndex: _questionIndex
      )
       :
      Result(_totalScore, _resetQuiz),
    ),);
  }
}
