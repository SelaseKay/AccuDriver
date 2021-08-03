import 'package:accudriver/assets/Constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AnswerOptionModel extends ChangeNotifier{
  bool _isCorrectAnswer = false;
  bool get isCorrectAnswer => _isCorrectAnswer;

  bool _isCorrectIconVisible = false;
  bool get isCorrectIconVisible => _isCorrectIconVisible;

  bool _isWrongIconVisible = false;
  bool get isWrongIconVisible => _isWrongIconVisible;

  HexColor _borderColor = Constants.INITIAL_BORDER_COLOR;
  HexColor get borderColor => _borderColor;

  HexColor _textColor = Constants.INITIAL_TEXT_COLOR;
  HexColor get textColor => _textColor;
 
  bool _isAnswerOptClickDisabled = false;
  bool get isAnswerOptClickDisabled => _isAnswerOptClickDisabled;

  Function onAnswerTap = (bool correctAnswer){};



  checkAnswerCorrectness(String option, String correctAnswer){
      if (option == correctAnswer){
        _isCorrectAnswer = true;
      }
      else{
        _isCorrectAnswer = false;
      }
      notifyListeners();
  }

  setAnswerOptionProps(bool isCorrectAnswer) {
    if (isCorrectAnswer) {
      _isCorrectIconVisible = true;
      _isWrongIconVisible = false;
      _borderColor =Constants.IS_CORRECT_COLOR;
      _textColor = Constants.IS_CORRECT_COLOR;
    } else {
      _isCorrectIconVisible = false;
      _isWrongIconVisible = true;
      _borderColor = Constants.IS_WRONG_COLOR;
      _textColor = Constants.IS_WRONG_COLOR;
    }
    notifyListeners();
  }

  setAnswerClickState(bool disabled){
    _isAnswerOptClickDisabled = disabled;
    notifyListeners();
  }


}