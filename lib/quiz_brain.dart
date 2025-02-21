import 'question.dart';
class QuizzBrain{
  int _questionNumber = 0;
  int countCorrectAnswers = 0;
  List<Question> _questionBank = [
    Question(questionText: 'O mel nunca estraga, mesmo após milhares de anos.', questionAnswer: true),
    Question(questionText: 'O Monte Everest é a montanha mais alta do mundo em relação ao nível do mar.', questionAnswer: true),
    Question(questionText: 'A água quente congela mais rápido do que a água fria.', questionAnswer: true),
    Question(questionText: 'O diamante é o material mais duro do mundo.', questionAnswer: false),
    Question(questionText: 'Os tubarões são mais antigos que as árvores.', questionAnswer: true),

  ];

  String finalCountdown (){
    return 'Sua pontuação foi: $countCorrectAnswers de ${_questionBank.length}';
  }
  bool isFinished(){
    if(_questionNumber==_questionBank.length - 1){

          return true;
    }else{
      return false;
    }
  }

  void reset (){
    _questionNumber = 0;
  }
  void nextQuestion(){
    if(_questionNumber< _questionBank.length -1){
      _questionNumber++;
    }

  }

  String getQuestionText (){
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer (){
    return _questionBank[_questionNumber].questionAnswer;
  }
}