import 'package:flutter/material.dart';
import 'package:accudriver/custom_widget/scoreboard.dart';
import 'package:accudriver/utils/widgetsize.dart';
import 'package:accudriver/custom_widget/timer.dart';
import 'package:accudriver/custom_widget/currentquestionIndicator.dart';
import 'package:hexcolor/hexcolor.dart';

class QuestionDisplay extends StatefulWidget {

  double _expansionTileSize = 0.0;

  final double screenWidth;

  final double timerHeight;

  final double questionViewWidth;

  final double questionImageSize;

  String currentQuestionNum;

  String totalQuestionNum;

  String leftScore;

  String rightScore;

  Function onExpansionTileChanged;

  // Function onOptionSelected;

  QuestionDisplay(
      {Key? key,
      required this.screenWidth,
      required this.timerHeight,
      required this.questionViewWidth,
      required this.questionImageSize,
      this.currentQuestionNum = "",
      this.totalQuestionNum = "",
      this.leftScore = "",
      this.rightScore = "",
      required this.onExpansionTileChanged(double)})
      : super(key: key);

  @override
  _QuestionDisplayState createState() => _QuestionDisplayState();
}

class _QuestionDisplayState extends State<QuestionDisplay> {
  @override
  Widget build(BuildContext context) {
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
                            parentHeight: widget.timerHeight,
                            parentWidth: widget.timerHeight),
                      ),
                    ),

                    ScoreBoard(
                      questionViewWidth: widget.questionViewWidth,
                      timerSize: widget.timerHeight,
                      leftText: widget.leftScore,
                      marginTop: 16.0,
                      marginLeft: 8.0,
                      barColor: HexColor('#8ECF94'),
                    ),

                    ScoreBoard(
                      questionViewWidth: widget.questionViewWidth,
                      timerSize: widget.timerHeight,
                      rightText: widget.rightScore,
                      barColor: HexColor('#D86B6B'),
                      marginLeft: (widget.questionViewWidth / 2) +
                          (widget.timerHeight / 2) -
                          8.0,
                      marginTop: 16.0,
                    ),

                  ],
                ),

                CurrentQuestionIndicator(
                  questionViewWidth: widget.questionViewWidth,
                  currentQuestionNum: '13',
                  totalQuestionNum: '20',
                ),

                ExpansionTile(
                  trailing: SizedBox.shrink(),
                  title: Text(
                      'Which of the following is part of the car\'s mainstream '),
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