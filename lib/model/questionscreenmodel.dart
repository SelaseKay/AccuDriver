import 'package:flutter/material.dart';

class QuestionScreenModel extends ChangeNotifier{
  bool _isAnswerOptClickDisabled = false;
  bool get isAnswerOptClickDisabled => _isAnswerOptClickDisabled;

  setAnswerClickState(bool state){
    _isAnswerOptClickDisabled = state;
  }
}