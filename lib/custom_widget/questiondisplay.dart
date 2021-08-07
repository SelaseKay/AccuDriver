import 'package:accudriver/dialog/timeupdialog.dart';
import 'package:accudriver/model/answeroptionmodel.dart';
import 'package:flutter/material.dart';
import 'package:accudriver/custom_widget/scoreboard.dart';
import 'package:accudriver/utils/widgetsize.dart';
import 'package:accudriver/custom_widget/timer.dart';
import 'package:accudriver/custom_widget/currentquestionIndicator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class QuestionDisplay extends StatefulWidget {
  double _expansionTileSize = 0.0;

  final double screenWidth;

  final double timerHeight;

  final double questionViewWidth;

  String questionText;

  final double questionImageSize;

  String currentQuestionNum;

  String totalQuestionNum;

  double leftScoreBarWidth;

  double rightScoreBarWidth;

  String leftScore;

  String rightScore;

  Function onExpansionTileChanged;

  Function onTimeUpListener;

  // Function onOptionSelected;

  QuestionDisplay(
      {Key? key,
      required this.screenWidth,
      required this.timerHeight,
      required this.questionViewWidth,
      required this.questionText,
      required this.questionImageSize,
      this.currentQuestionNum = "",
      this.totalQuestionNum = "",
      this.leftScoreBarWidth = 4.0,
      this.rightScoreBarWidth = 4.0,
      this.leftScore = "",
      this.rightScore = "",
      required this.onTimeUpListener,
      required this.onExpansionTileChanged(double)})
      : super(key: key);

  @override
  _QuestionDisplayState createState() => _QuestionDisplayState();
}

class _QuestionDisplayState extends State<QuestionDisplay> {
  

  @override
  Widget build(BuildContext context) {
    final _answerOptionModel = Provider.of<AnswerOptionModel>(context);

    return Column(
      children: [
        //Positioned(
        //width: screenWidth,
        // bottom: -50.0,
        Container(
          width: widget.screenWidth,
          margin: EdgeInsets.only(left: 24.0, right: 24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(21)),
            boxShadow: [
              BoxShadow(
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0), // shadow direction: bottom right
              )
            ],
          ),
          child: WidgetSize(
            onChange: (Size size) {
              setState(() {
                widget._expansionTileSize = size.height;
                widget.onExpansionTileChanged(widget._expansionTileSize);
              });
            },
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: ((widget.screenWidth - 48) * 1 / 2) -
                          widget.timerHeight / 2,
                      top: -(widget.timerHeight / 2),
                      child: Container(
                        child: Timer(
                            onTimeUp: (animatedValue){
                                if(animatedValue.toInt() == 30){
                                  _answerOptionModel.setAnswerClickState(true);
                                  _answerOptionModel.setTimeUpState(true);
                                  widget.onTimeUpListener();
                                }
                            },
                            parentHeight: widget.timerHeight,
                            parentWidth: widget.timerHeight),
                      ),
                    ),
                    ScoreBoard(
                      questionViewWidth: widget.questionViewWidth,
                      scoreBarWidth: widget.leftScoreBarWidth,
                      timerSize: widget.timerHeight,
                      leftText: widget.leftScore,
                      marginTop: 16.0,
                      marginLeft: 8.0,
                      barColor: HexColor('#D86B6B'),
                    ),
                    ScoreBoard(
                      questionViewWidth: widget.questionViewWidth,
                      scoreBarWidth: widget.rightScoreBarWidth,
                      timerSize: widget.timerHeight,
                      rightText: widget.rightScore,
                      barColor: HexColor('#8ECF94'),
                      marginLeft: (widget.questionViewWidth / 2) +
                          (widget.timerHeight / 2) -
                          8.0,
                      marginTop: 16.0,
                    ),
                  ],
                ),
                CurrentQuestionIndicator(
                  questionViewWidth: widget.questionViewWidth,
                  currentQuestionNum: widget.currentQuestionNum,
                  totalQuestionNum: widget.totalQuestionNum,
                ),
                ExpansionTile(
                  trailing: SizedBox.shrink(),
                  title: Text("${widget.questionText}"),
                  tilePadding: EdgeInsets.only(
                      top: 16.0, bottom: 8.0, right: 16.0, left: 16.0),
                  children: [
                    Container(child: Text('')),
                    // Visibility(
                    //     child: Image.asset(
                    //   '',
                    //   width: widget.questionImageSize,
                    //   height: widget.questionImageSize,
                    // ))
                  ],
                  initiallyExpanded: false,
                  onExpansionChanged: (bool) {
                    if (bool) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
