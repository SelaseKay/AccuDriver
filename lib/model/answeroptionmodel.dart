import 'package:accudriver/database/questiondb.dart';
import 'package:accudriver/model/question.dart';
import 'package:accudriver/model/state/answeroptionstates.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

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

  int _animatedValue = 0;

  updateQuestion(AnimationController controller) {
    developer.log("${controller.value}", name: "updateQuestion");
    if (_isAnswerSelected) {
      _goToNextQuestion(controller);
    } 
    //check if no option is selected and time is up
    else if (!_isAnswerSelected && _animatedValue == 30) {
      _goToNextQuestion(controller);
    }
  }

  _goToNextQuestion(AnimationController controller) {
    if (_currentQuestionIdx < _dbInstance.questionList.length - 1) {
      _currentQuestionIdx++;
      _question = _dbInstance.questionList[_currentQuestionIdx];
      _resetTimer(controller);
      refreshAnswerOptionState();
      notifyListeners();
    }
  }

  _resetTimer(AnimationController controller) {
    controller.reset();
    controller.forward();
  }

  _incrementCorrectAnswerCounter() {
    _correctAnswerCounter++;
    notifyListeners();
  }

  _incrementWrongAnswerCounter() {
    _wrongAnswerCounter++;
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
    developer.log("isOnClickDisabled: $disabled", name: "setAnswerClickState");
    notifyListeners();
  }

  setAnswerClickState1(bool disabled){
    _isAnswerOptClickDisabled = disabled;
  }

  setAnimatedValue(int value){
    _animatedValue = value;
  }
}
