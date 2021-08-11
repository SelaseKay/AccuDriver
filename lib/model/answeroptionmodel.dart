import 'package:accudriver/assets/Strings.dart';
import 'package:accudriver/database/questiondb.dart';
import 'package:accudriver/dialog/nextdialog.dart';
import 'package:accudriver/dialog/scoredialog.dart';
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

  List<Question> _questions = List.empty();

  int get totalQuestionNum => _questions.length;

  QuestionDb _dbInstance = QuestionDb.instance;

  bool _isAnswerSelected = false;

  bool _isTimeUp = false;

  Future<List<Question>> get questions async{
    _questions = await _dbInstance.getQuestions();
    return _questions;
  }

  // Future<Question> getQuestion() async{
  //     var questions = await getQuestions();
  //     return await questions[currentQuestionIdx];
  // }

  // Question get question {
    
  // }

  // Question get question async{
  //   _getQuestions();
  //   return _questions[_currentQuestionIdx];
  // }


  updateQuestion(AnimationController controller, BuildContext context) {
    developer.log("${controller.value}", name: "updateQuestion");
    if (_isAnswerSelected) {
      _goToNextQuestion(controller);
    }
    //check if no option is selected and time is up
    else if (!_isAnswerSelected && _isTimeUp) {
      // check if you are on last question
      if (_currentQuestionIdx + 1 == totalQuestionNum) {
        showScoreDialog(context, getScoreString());
      } else {
        _goToNextQuestion(controller);
      }
    } else {
      controller.stop();
      showNextDialog(controller, context);
    }
  }

  _goToNextQuestion(AnimationController controller) {
    if (_currentQuestionIdx < _questions.length - 1) {
      _currentQuestionIdx++;
      // _question = _questions[_currentQuestionIdx];
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
    _isTimeUp = false;
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

  setAnswerClickState1(bool disabled) {
    _isAnswerOptClickDisabled = disabled;
  }

  setTimeUpState(bool isTimeUp) {
    _isTimeUp = isTimeUp;
  }

  _getScore() {
    return ((_correctAnswerCounter / totalQuestionNum) * 100)
        .toStringAsFixed(2);
  }

  getScoreString() {
    return Strings.yourScoreIs + _getScore() + "%";
  }

}
