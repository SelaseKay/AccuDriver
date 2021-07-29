import 'package:accudriver/custom_widget/answeroption.dart';
import 'package:accudriver/custom_widget/currentquestionIndicator.dart';
import 'package:accudriver/custom_widget/purplebackground.dart';
import 'package:accudriver/custom_widget/questiondisplay.dart';
import 'package:accudriver/custom_widget/scoreboard.dart';
import 'package:accudriver/custom_widget/timer.dart';
import 'package:accudriver/utils/widgetsize.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class QuestionsScreen extends StatefulWidget {
  double _expansionTileSize = 0.0;

  bool _isOnOptPressedEnabled = true;
  
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

    final double questionImageSize = questionViewWidth / 1.5;

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

                        PurpleBackground(
                            marginTop: statusBarHeight + statusBarHeight / 2,
                            height: questionBackgroundHeight),

                        Positioned(
                          width: screenWidth,
                          top: questionBackgroundHeight -
                              (questionViewHeight / 4),
                          child: QuestionDisplay(
                            screenWidth: screenWidth,
                            questionViewWidth: questionViewWidth,
                            questionImageSize: questionImageSize,
                            timerHeight: timerWidth,
                            leftScore: '03',
                            rightScore: '07',
                            onExpansionTileChanged: (size){
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

                  AnswerOption(
                    onAnswerSelected: (bool isCorrect){

                    },
                    marginTop: 0.0,
                    marginLeftRight: 32.0,
                    isCorrectIconVisible: false,
                    isWrongIconVisible: false,
                  ),

                  AnswerOption(
                    onAnswerSelected: (bool isCorrect){
                      
                    },
                    marginTop: 8.0,
                    marginBottom: 8.0,
                    marginLeftRight: 32.0,
                    isCorrectIconVisible: false,
                    isWrongIconVisible: false,
                  ),

                  Container(margin: EdgeInsets.only(top: 20.0), child: MaterialButton(onPressed: (){}, color: Colors.blue, height: 10.0,))

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateQuestionNumber(){
    setState(() {
      
    });
  }

}
