import 'package:accudriver/model/state/answeroptionstates.dart';
import 'package:accudriver/assets/Constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AnswerOptionModel extends ChangeNotifier{
  bool _isCorrectAnswer = false;
  bool get isCorrectAnswer => _isCorrectAnswer;

  AnswerOptionState _answerOptionState = AnswerOptionState();
  AnswerOptionState get answerOptionState => _answerOptionState; 
 
  bool _isAnswerOptClickDisabled = false;
  bool get isAnswerOptClickDisabled => _isAnswerOptClickDisabled;

  Function onAnswerTap = (bool correctAnswer){};


  checkAnswerCorrectness(String option, String correctAnswer){
      if (option == correctAnswer){
        _isCorrectAnswer = true;
        _answerOptionState = CorrectAnswerState();
      }
      else{
        _isCorrectAnswer = false;
        _answerOptionState = WrongAnswerState();
      }
      notifyListeners();
  }

  setAnswerClickState(bool disabled){
    _isAnswerOptClickDisabled = disabled;
    notifyListeners();
  }


}