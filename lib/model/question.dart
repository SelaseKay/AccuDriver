import 'dart:typed_data';


class Question {
  int questionId;
  String questionText;
  String optionA;
  String optionB;
  String optionC;
  String optionD;
  String correctAnswer;
  Uint8List? questionImage;

  Question(
      {this.questionId = 0,
      this.questionText = "",
      this.optionA = "",
      this.optionB = "",
      this.optionC = "",
      this.optionD = "",
      this.questionImage,
      this.correctAnswer = ""});
}
