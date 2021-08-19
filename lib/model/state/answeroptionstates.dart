import 'package:accudriver/assets/Constants.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class AnswerOptionState {
  HexColor borderColor = Constants.INITIAL_BORDER_COLOR;
  HexColor textColor = Constants.INITIAL_TEXT_COLOR;
  bool isCorrectIconVisible = false;
  bool isWrongIconVisible = false;
}

class CorrectAnswerState extends AnswerOptionState {
  HexColor _borderColor = Constants.IS_CORRECT_COLOR;
  HexColor _textColor = Constants.IS_CORRECT_COLOR;
  bool _isCorrectIconVisible = true;
  bool _isWrongIconVisible = false;

  @override
  HexColor get borderColor => _borderColor;

  @override
  HexColor get textColor => _textColor;

  @override
  bool get isCorrectIconVisible => _isCorrectIconVisible;

  @override
  bool get isWrongIconVisible => _isWrongIconVisible;
}

class WrongAnswerState extends AnswerOptionState {
  HexColor _borderColor = Constants.IS_WRONG_COLOR;
  HexColor _textColor = Constants.IS_WRONG_COLOR;
  bool _isCorrectIconVisible = false;
  bool _isWrongIconVisible = true;

  @override
  HexColor get borderColor => _borderColor;

  @override
  HexColor get textColor => _textColor;

  @override
  bool get isCorrectIconVisible => _isCorrectIconVisible;

  @override
  bool get isWrongIconVisible => _isWrongIconVisible;
}
