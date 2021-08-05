class Question {
  int questionId;
  String questionText;
  String optionA;
  String optionB;
  String optionC;
  String optionD;
  String correctAnswer;

  Question(
      {this.questionId = 0,
      this.questionText = "",
      this.optionA = "",
      this.optionB = "",
      this.optionC = "",
      this.optionD = "",
      this.correctAnswer = ""});
}
