import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizzBrain quizzBrain = QuizzBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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


void chekAnswer(bool userPickedAnswer){
  bool correctAnswer = quizzBrain.getCorrectAnswer();
  setState(() {

    if(quizzBrain.isFinished()==true) {
      Alert(
        context: context,
        title: 'Terminou!',
        desc: 'Você chegou no final do Quizz. ${quizzBrain.finalCountdown()}'
            ,
        buttons: [
          DialogButton(child: Text('Voltar para o ínicio',
            style: TextStyle(color: Colors.white, fontSize: 20),),
    onPressed: () => Navigator.pop(context),
          )]


      ).show();
      quizzBrain.reset();
      scoreKeeper = [];
    }
    else {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
        quizzBrain.countCorrectAnswers++;

      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
      };

      quizzBrain.nextQuestion();
    }});
}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
              quizzBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child:TextButton (
              style:TextButton.styleFrom(
                foregroundColor: Colors.green.shade900,
              backgroundColor: Colors.green),

              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                chekAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
    style:TextButton.styleFrom(
    foregroundColor: Colors.red.shade900,
    backgroundColor: Colors.red),

              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                chekAnswer(false);
                //The user picked false.

              },
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
