import 'package:accudriver/custom_widget/nextbutton.dart';
import 'package:accudriver/database/questiondb.dart';
import 'package:accudriver/dialog/exitdialog.dart';
import 'package:accudriver/dialog/starttimerdialog.dart';
import 'package:accudriver/dialog/timeupdialog.dart';
import 'package:accudriver/model/question.dart';
import 'package:accudriver/model/state/answeroptionstates.dart';
import 'package:accudriver/custom_widget/answeroption.dart';
import 'package:accudriver/custom_widget/purplebackground.dart';
import 'package:accudriver/custom_widget/questiondisplay.dart';
import 'package:accudriver/model/answeroptionmodel.dart';
import 'package:accudriver/model/timermodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:async';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({Key? key}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // late Future<bool> _exitDialogListener;

  @override
  Widget build(BuildContext context) {
    // _exitDialogListener = showExitDialog(context);
    return WillPopScope(
      onWillPop: () => showExitDialog(context),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: MultiProvider(providers: [
              ChangeNotifierProvider(create: (context) => AnswerOptionModel()),
              ChangeNotifierProvider(create: (context) => TimerModel())
            ], child: _QuestionPage()),
          )),
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

  // late Question question;

  late AnswerOptionModel _answerOptionModel;
  late TimerModel _timerModel;

  late Future<void> _dbInit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showBeginTimerdialog(context, () {
        _timerModel.controller!.forward();
      });
    });
    _dbInit = QuestionDb().initDb();
  }

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

    // Providers

    // _answerOptionModel.setOnTimeUpListener((){
    //   showTimeUpDialog(context, (){
    //     print("Time is up");
    //   });
    // });
    _answerOptionModel = Provider.of<AnswerOptionModel>(context);

    _timerModel = Provider.of<TimerModel>(context);

    final _isAnswerOptClickDisabled = context.select<AnswerOptionModel, bool>(
        (value) => value.isAnswerOptClickDisabled);

    return Container(
        height: double.infinity,
        width: double.infinity,
        child: FutureBuilder(future: _dbInit.then((value) {
          return _answerOptionModel.questions;
        }), builder:
            (BuildContext context, AsyncSnapshot<List<Question>> questions) {
          if (questions.hasData) {
            return SingleChildScrollView(
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
                              top: questionBackgroundHeight -
                                  (questionViewHeight / 4),
                              child: QuestionDisplay(
                                questionText: _getQuestionText(questions.data!),
                                leftScoreBarWidth: (_answerOptionModel
                                            .wrongAnswerCounter /
                                        _answerOptionModel.totalQuestionNum) *
                                    maxWidthOfScoreBar,
                                rightScoreBarWidth: (_answerOptionModel
                                            .correctAnswerCounter /
                                        _answerOptionModel.totalQuestionNum) *
                                    maxWidthOfScoreBar,
                                screenWidth: screenWidth,
                                questionViewWidth: questionViewWidth,
                                questionImageSize: questionImageSize,
                                currentQuestionNum:
                                    "${_answerOptionModel.currentQuestionNum}",
                                totalQuestionNum:
                                    "${_answerOptionModel.totalQuestionNum}",
                                timerHeight: timerHeight,
                                leftScore:
                                    "${_answerOptionModel.wrongAnswerCounter}",
                                rightScore:
                                    "${_answerOptionModel.correctAnswerCounter}",
                                onExpansionTileChanged: (size) {
                                  setState(() {
                                    widget._expansionTileSize = size;
                                  });
                                },
                                onTimeUpListener: () {
                                  showTimeUpDialog(context, () {
                                    _onNextButtonClick(
                                        _answerOptionModel, _timerModel);
                                  });
                                },
                                questionImg: _getQuestionImage(questions.data!),
                                isQuestionImgVisible:
                                    _getQuestionImage(questions.data!) != null
                                        ? true
                                        : false,
                              )),
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
                        option: _getOptionA(questions.data!),
                        correctAnswer: _getCorrectAnswer(questions.data!),
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
                        option: _getOptionB(questions.data!),
                        correctAnswer: _getCorrectAnswer(questions.data!),
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
                        option: _getOptionC(questions.data!),
                        correctAnswer: _getCorrectAnswer(questions.data!),
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
                        option: _getOptionD(questions.data!),
                        correctAnswer: _getCorrectAnswer(questions.data!),
                        marginTop: 8.0,
                        marginBottom: 8.0,
                        marginLeftRight: 32.0,
                      ),
                    ),
                    Visibility(
                      visible: _getNextButtonVisibleState(_answerOptionModel),
                      child: NextButton(onPressed: () {
                        _onNextButtonClick(_answerOptionModel, _timerModel);
                      }),
                    )
                  ],
                ),
              ),
            );
          }
          return Center(
              child: SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: CircularProgressIndicator()));
        }));
  }

  _onNextButtonClick(
      AnswerOptionModel answerOptionModel, TimerModel timerModel) async {
    answerOptionModel.updateQuestion(timerModel.controller!, context);
    // question = answerOptionModel.question;
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

  _getNextButtonVisibleState(AnswerOptionModel model) {
    return model.currentQuestionNum == model.totalQuestionNum ? false : true;
  }

  _getQuestionText(List<Question> questions) {
    return questions[_answerOptionModel.currentQuestionIdx].questionText;
  }

  _getOptionA(List<Question> questions) {
    return questions[_answerOptionModel.currentQuestionIdx].optionA;
  }

  _getOptionB(List<Question> questions) {
    return questions[_answerOptionModel.currentQuestionIdx].optionB;
  }

  _getOptionC(List<Question> questions) {
    return questions[_answerOptionModel.currentQuestionIdx].optionC;
  }

  _getOptionD(List<Question> questions) {
    return questions[_answerOptionModel.currentQuestionIdx].optionD;
  }

  _getCorrectAnswer(List<Question> questions) {
    return questions[_answerOptionModel.currentQuestionIdx].correctAnswer;
  }

  _getQuestionImage(List<Question> questions) {
    return questions[_answerOptionModel.currentQuestionIdx].questionImage;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    QuestionDb().closeDb();
  }
}
