import 'package:accudriver/model/question.dart';

class QuestionDb{
  
  List<Question> _questionList = List.empty();
  List<Question> get questionList => _questionList;

  QuestionDb._questionDbConstructor(){

    Question q1 = Question(
      questionId: 1,
      questionText: "Which of these is required of any driver who displays the Trade Licence Plate on his vehicle?",
      optionA: "He must not drive above 50 Km/h",
      optionB: "He must not carry more than one passenger",
      optionC: "He must do all the above",
      optionD: "He must display his log book on the vehicle",
      correctAnswer: "He must not carry more than one passenger"
    );

    Question q2 = Question(
      questionId: 2,
      questionText: "You are driving on a motorway.  The car ahead shows its hazard lights for a short time.  This tells you that;",
      optionA: "The driver wants you to overtake",
      optionB: "The other car is going to change lanes",
      optionC: "There is a police speed check ahead",
      optionD: "Traffic ahead is slowing or stopping suddenly",
      correctAnswer: "Traffic ahead is slowing or stopping suddenly"
    );

    Question q3 = Question(
      questionId: 3,
      questionText: "Warning signs are always indicated with the following;",
      optionA: "Blue colour back ground with red circular boundaries",
      optionB: "Green colour back ground with white rectangular boundaries",
      optionC: "Blue black naval colour back ground with yellow square boundaries",
      optionD: "White colour back ground with red triangular boundaries",
      correctAnswer: "White colour back ground with red triangular boundaries"
    );

    _questionList = [q1, q2, q3];
  }

  

  static final QuestionDb instance = QuestionDb._questionDbConstructor();



}