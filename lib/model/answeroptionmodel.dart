import 'package:accudriver/database/questiondb.dart';
import 'package:accudriver/model/question.dart';
import 'package:accudriver/model/state/answeroptionstates.dart';
import 'package:flutter/material.dart';

class AnswerOptionModel extends ChangeNotifier {
  bool _isCorrectAnswer = false;
  bool get isCorrectAnswer => _isCorrectAnswer;

  AnswerOptionState _answerOptionState = AnswerOptionState();
  AnswerOptionState get answerOptionState => _answerOptionState;

  bool _isAnswerOptClickDisabled = false;
  bool get isAnswerOptClickDisabled => _isAnswerOptClickDisabled;

  int _correctAnswerCounter = 0;
  int get correctAnswerCounter => _correctAnswerCounter;

  int _wrongAnswerCounter = 0;
  int get wrongAnswerCounter => _wrongAnswerCounter;

  int _currentQuestionIdx = 0;
  int get currentQuestionIdx => _currentQuestionIdx;
  int get currentQuestionNum => _currentQuestionIdx + 1;

  int get totalQuestionNum => _dbInstance.questionList.length;

  QuestionDb _dbInstance = QuestionDb.instance;

  Question _question = QuestionDb.instance.questionList[0];
  Question get question => _question;

  bool _isAnswerSelected = false;

  updateQuestion(AnimationController controller) {
    if (_isAnswerSelected) {
      if (_currentQuestionIdx < _dbInstance.questionList.length - 1) {
        _currentQuestionIdx++;
        _question = _dbInstance.questionList[_currentQuestionIdx];
        _resetTimer(controller);
        refreshAnswerOptionState();
        notifyListeners();
      }
    } 
  }

  _resetTimer(AnimationController controller){
    controller.reset();
    controller.forward();
  }

  _incrementCorrectAnswerCounter(){
    _correctAnswerCounter ++;
    notifyListeners();
  }

  _incrementWrongAnswerCounter(){
    _wrongAnswerCounter ++;
    notifyListeners();
  }

  refreshAnswerOptionState() {
    _answerOptionState = AnswerOptionState();
    _isAnswerSelected = false;
    _isAnswerOptClickDisabled = false;
  }

  checkAnswerCorrectness(String option, String correctAnswer) {
    if (option == correctAnswer) {
      _isCorrectAnswer = true;
      _answerOptionState = CorrectAnswerState();
      _incrementCorrectAnswerCounter();
    } else {
      _isCorrectAnswer = false;
      _answerOptionState = WrongAnswerState();
      _incrementWrongAnswerCounter();
    }
    _isAnswerSelected = true;
    notifyListeners();
  }

  setAnswerClickState(bool disabled) {
    _isAnswerOptClickDisabled = disabled;
    notifyListeners();
  }
}
