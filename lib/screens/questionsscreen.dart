import 'package:accudriver/answeroptionstates.dart';
import 'package:accudriver/assets/Constants.dart';
import 'package:accudriver/custom_widget/answeroption.dart';
import 'package:accudriver/custom_widget/purplebackground.dart';
import 'package:accudriver/custom_widget/questiondisplay.dart';
import 'package:accudriver/model/answeroptionmodel.dart';
import 'package:accudriver/model/questionscreenmodel.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
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
      home: Scaffold(body: _QuestionPage()),
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
  AnswerOptionState _ansOpt1State = AnswerOptionState();
  AnswerOptionState _ansOpt2State = AnswerOptionState();

  bool _isGestureDetectDisabled = false;

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

    // final answerOptionModel = Provider.of<AnswerOptionModel>(context);

    // Answer option states

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
                        screenWidth: screenWidth,
                        questionViewWidth: questionViewWidth,
                        questionImageSize: questionImageSize,
                        timerHeight: timerHeight,
                        leftScore: '03',
                        rightScore: '07',
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
                absorbing: _isGestureDetectDisabled,
                child: AnswerOption(
                  answerOptionState: _ansOpt1State,
                  onAnswerSelected:
                      (bool isCorrect, bool isGestureDetectorDisabled) {
                    // ansOpt1State =
                    //     answerOptionModel.answerOptionState;

                    setState(() {
                      if (isCorrect) {
                        _ansOpt1State = CorrectAnswerState();
                      } else {
                        _ansOpt1State = WrongAnswerState();
                      }
                      _isGestureDetectDisabled = true;
                    });
                  },
                  marginTop: 0.0,
                  marginLeftRight: 32.0,
                ),
              ),
              AbsorbPointer(
                absorbing: _isGestureDetectDisabled,
                child: AnswerOption(
                  answerOptionState: _ansOpt2State,
                  onAnswerSelected:
                      (bool isCorrect, bool isGestureDetectorEnabled) {
                    print("object");
                    // ansOpt2State =
                    //     answerOptionModel.answerOptionState;

                    setState(() {
                      if (isCorrect) {
                        _ansOpt2State = CorrectAnswerState();
                      } else {
                        _ansOpt2State = WrongAnswerState();
                      }
                      _isGestureDetectDisabled = true;
                    });
                  },
                  marginTop: 8.0,
                  marginBottom: 8.0,
                  marginLeftRight: 32.0,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.blue,
                    height: 10.0,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
