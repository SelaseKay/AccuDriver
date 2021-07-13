import 'package:accudriver/custom_widget/timerpainter.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

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

    final double timerHeight = questionViewHeight * 0.5;

    final double timerWidth = (screenWidth - 48) / 3;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    fit: StackFit.loose,
                    clipBehavior: Clip.none,
                    children: [
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
                        height: questionViewHeight,
                        width: screenWidth,
                        bottom: -50.0,
                        child: Container(
                          margin: EdgeInsets.only(left: 24.0, right: 24.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(21)),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                left: ((screenWidth - 48) * 1/2) - timerHeight / 2,
                                top: -(timerHeight / 2),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.white),
                                  child: CustomPaint(
                                    painter: TimerPainter(
                                        parentHeight: timerHeight,
                                        parentWidth: timerHeight),
                                  ),
                                ),
                              )
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
        ),
      ),
    );
  }
}
