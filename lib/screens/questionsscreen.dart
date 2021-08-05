import 'package:accudriver/custom_widget/answeroption.dart';
import 'package:accudriver/custom_widget/currentquestionIndicator.dart';
import 'package:accudriver/custom_widget/scoreboard.dart';
import 'package:accudriver/custom_widget/timer.dart';
import 'package:accudriver/utils/widgetsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class QuestionsScreen extends StatefulWidget {
  late double _expansionTileSize = 0.0;

  QuestionsScreen({Key? key}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
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

    final double timerWidth = (screenWidth - 48) / 3;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
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
                        Container(
                          margin: EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              top: statusBarHeight + statusBarHeight / 2),
                          height: questionBackgroundHeight,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: HexColor('#9F75C8'),
                            borderRadius: BorderRadius.all(Radius.circular(31)),
                          ),
                        ),
                        Positioned(
                          width: screenWidth,
                          top: questionBackgroundHeight -
                              (questionViewHeight / 4),
                          child: Column(
                            children: [
                              //Positioned(
                              //width: screenWidth,
                              // bottom: -50.0,
                              Container(
                                width: screenWidth,
                                margin:
                                    EdgeInsets.only(left: 24.0, right: 24.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(21)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2.0,
                                          2.0), // shadow direction: bottom right
                                    )
                                  ],
                                ),
                                child: WidgetSize(
                                  onChange: (Size size) {
                                    setState(() {
                                      widget._expansionTileSize = size.height;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Positioned(
                                            left: ((screenWidth - 48) * 1 / 2) -
                                                timerHeight / 2,
                                            top: -(timerHeight / 2),
                                            child: Container(
                                              child: Timer(
                                                  parentHeight: timerHeight,
                                                  parentWidth: timerHeight),
                                            ),
                                          ),
                                          ScoreBoard(
                                            questionViewWidth:
                                                questionViewWidth,
                                            timerSize: timerHeight,
                                            leftText: '03',
                                            marginTop: 16.0,
                                            marginLeft: 8.0,
                                            barColor: HexColor('#8ECF94'),
                                          ),
                                          ScoreBoard(
                                            questionViewWidth:
                                                questionViewWidth,
                                            timerSize: timerHeight,
                                            rightText: '03',
                                            barColor: HexColor('#D86B6B'),
                                            marginLeft:
                                                (questionViewWidth / 2) +
                                                    (timerHeight / 2) -
                                                    8.0,
                                            marginTop: 16.0,
                                          ),
                                        ],
                                      ),
                                      CurrentQuestionIndicator(
                                        questionViewWidth: questionViewWidth,
                                        currentQuestionNum: '13',
                                        totalQuestionNum: '20',
                                      ),
                                      ExpansionTile(
                                        trailing: SizedBox.shrink(),
                                        title: Text(
                                            'Which of the following is part of the car\'s mainstream '),
                                        tilePadding: EdgeInsets.only(
                                            top: 16.0,
                                            bottom: 8.0,
                                            right: 16.0,
                                            left: 16.0),
                                        children: [
                                          Container(child: Text('')),
                                        ],
                                        initiallyExpanded: true,
                                        onExpansionChanged: (bool) {
                                          if (bool) {}
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: widget._expansionTileSize,
                  ),
                  AnswerOption(
                    marginTop: 0.0,
                    marginLeftRight: 32.0,
                    isCorrectIconVisible: false,
                    isWrongIconVisible: false,
                  ),
                  AnswerOption(
                    marginTop: 8.0,
                    marginBottom: 8.0,
                    marginLeftRight: 32.0,
                    isCorrectIconVisible: false,
                    isWrongIconVisible: false,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
