import 'package:accudriver/database/questiondb.dart';
import 'package:accudriver/model/question.dart';
import 'package:accudriver/model/state/answeroptionstates.dart';
import 'package:accudriver/custom_widget/answeroption.dart';
import 'package:accudriver/custom_widget/purplebackground.dart';
import 'package:accudriver/custom_widget/questiondisplay.dart';
import 'package:accudriver/model/answeroptionmodel.dart';
import 'package:accudriver/model/timermodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({Key? key}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => AnswerOptionModel()),
        ChangeNotifierProvider(create: (context) => TimerModel())
      ], child: _QuestionPage())),
    );
  }
}

class _QuestionPage extends StatefulWidget {
  double _expansionTileSize = 0.0;

  _QuestionPage({Key? key}) : super(key: key);

  @override
  __QuestionPageState createState() => __QuestionPageState();
}

class __QuestionPageState extends State<_QuestionPage> {
  // Answer Option States
  AnswerOptionState _ansOpt1State = AnswerOptionState();
  AnswerOptionState _ansOpt2State = AnswerOptionState();
  AnswerOptionState _ansOpt3State = AnswerOptionState();
  AnswerOptionState _ansOpt4State = AnswerOptionState();

  Question question = QuestionDb.instance.questionList[0];

  int _timerAnimatedValue = 0;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    final double screenHeight =
        MediaQuery.of(context).size.height - statusBarHeight;

    final double screenWidth = MediaQuery.of(context).size.width;

    final double questionBackgroundHeight = screenHeight * 0.5;

    final double questionViewHeight = questionBackgroundHeight * 0.5;

    final double questionViewWidth = screenWidth - 48;

    final double timerHeight = questionViewHeight * 0.5;

    final double questionImageSize = questionViewWidth / 1.5;

    final double timerWidth = (screenWidth - 48) / 3;

    final double barPaddings = 26.0;

    final double maxWidthOfScoreBar =
        (questionViewWidth / 2) - (timerHeight / 2) - barPaddings;

    // Provider
    final _answerOptionModel = Provider.of<AnswerOptionModel>(context);

    final _isAnswerOptClickDisabled = context.select<AnswerOptionModel, bool>((value) => value.isAnswerOptClickDisabled);

    final _timerModel = Provider.of<TimerModel>(context);

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      child: Column(),
                    ),
                    PurpleBackground(
                        marginTop: statusBarHeight + statusBarHeight / 2,
                        height: questionBackgroundHeight),
                    Positioned(
                      width: screenWidth,
                      top: questionBackgroundHeight - (questionViewHeight / 4),
                      child: QuestionDisplay(
                        questionText: question.questionText,
                        leftScoreBarWidth:
                            (_answerOptionModel.wrongAnswerCounter / 3) *
                                maxWidthOfScoreBar,
                        rightScoreBarWidth:
                            (_answerOptionModel.correctAnswerCounter / 3) *
                                maxWidthOfScoreBar,
                        screenWidth: screenWidth,
                        questionViewWidth: questionViewWidth,
                        questionImageSize: questionImageSize,
                        currentQuestionNum:
                            "${_answerOptionModel.currentQuestionNum}",
                        totalQuestionNum:
                            "${_answerOptionModel.totalQuestionNum}",
                        timerHeight: timerHeight,
                        leftScore: "${_answerOptionModel.wrongAnswerCounter}",
                        rightScore:
                            "${_answerOptionModel.correctAnswerCounter}",
                        onExpansionTileChanged: (size) {
                          setState(() {
                            widget._expansionTileSize = size;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: widget._expansionTileSize,
              ),
              AbsorbPointer(
                absorbing: _isAnswerOptClickDisabled,
                child: AnswerOption(
                  answerOptionState: _ansOpt1State,
                  onAnswerSelected:
                      (bool isCorrect, bool isGestureDetectorDisabled) {
                    _ansOpt1State = _answerOptionModel.answerOptionState;
                    _pauseTimer(_timerModel);
                  },
                  option: question.optionA,
                  correctAnswer: question.correctAnswer,
                  marginTop: 0.0,
                  marginLeftRight: 32.0,
                ),
              ),
              AbsorbPointer(
                absorbing: _isAnswerOptClickDisabled,
                child: AnswerOption(
                  answerOptionState: _ansOpt2State,
                  onAnswerSelected:
                      (bool isCorrect, bool isGestureDetectorEnabled) {
                    _ansOpt2State = _answerOptionModel.answerOptionState;
                    _pauseTimer(_timerModel);
                  },
                  option: question.optionB,
                  correctAnswer: question.correctAnswer,
                  marginTop: 8.0,
                  marginBottom: 8.0,
                  marginLeftRight: 32.0,
                ),
              ),
              AbsorbPointer(
                absorbing: _isAnswerOptClickDisabled,
                child: AnswerOption(
                  answerOptionState: _ansOpt3State,
                  onAnswerSelected:
                      (bool isCorrect, bool isGestureDetectorEnabled) {
                    _ansOpt3State = _answerOptionModel.answerOptionState;
                    _pauseTimer(_timerModel);
                  },
                  option: question.optionC,
                  correctAnswer: question.correctAnswer,
                  marginTop: 8.0,
                  marginBottom: 8.0,
                  marginLeftRight: 32.0,
                ),
              ),
              AbsorbPointer(
                absorbing: _isAnswerOptClickDisabled,
                child: AnswerOption(
                  answerOptionState: _ansOpt4State,
                  onAnswerSelected:
                      (bool isCorrect, bool isGestureDetectorEnabled) {
                    _ansOpt4State = _answerOptionModel.answerOptionState;
                    _pauseTimer(_timerModel);
                  },
                  option: question.optionD,
                  correctAnswer: question.correctAnswer,
                  marginTop: 8.0,
                  marginBottom: 8.0,
                  marginLeftRight: 32.0,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: MaterialButton(
                    onPressed: () =>
                        _onNextButtonClick(_answerOptionModel, _timerModel),
                    color: Colors.blue,
                    height: 10.0,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _onNextButtonClick(
      AnswerOptionModel answerOptionModel, TimerModel timerModel) {
    answerOptionModel.updateQuestion(timerModel.controller!);
    question = answerOptionModel.question;
    _refreshAnswerOptionStates(answerOptionModel);
  }

  _refreshAnswerOptionStates(AnswerOptionModel model) {
    _ansOpt1State = model.answerOptionState;
    _ansOpt2State = model.answerOptionState;
    _ansOpt3State = model.answerOptionState;
    _ansOpt4State = model.answerOptionState;
  }

  _pauseTimer(TimerModel model) {
    if (model.controller!.isAnimating) {
      model.controller!.stop();
    }
  }
}
