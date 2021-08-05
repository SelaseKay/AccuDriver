import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

// ignore: must_be_immutable
class TestCard extends StatefulWidget {
  final String cardColor;
  final double topMargin;
  final String cardTitle;
  final String numOfQuestions;
  final String passMark;
  final String passMarkBgColor;
  final String passMarkTextColor;
  final String questionsBgColor;
  final String questionsTextColor;
  final Function() onClick;

  final List<HexColor> buttonGradientColor;

  const TestCard({
    Key? key,
    required this.cardColor,
    required this.topMargin,
    required this.cardTitle,
    required this.numOfQuestions,
    required this.passMark,
    required this.passMarkBgColor,
    required this.passMarkTextColor,
    required this.questionsBgColor,
    required this.questionsTextColor,
    required this.buttonGradientColor,
    required this.onClick
  }) : super(key: key);

  @override
  _TestCardState createState() => _TestCardState();
}

class _TestCardState extends State<TestCard> {
  @override
  Widget build(BuildContext context) {
    final double questionWidgetWidth =
        (MediaQuery.of(context).size.width - 32 - 14 - 22) * 0.5;
    final double startButtonWidth = questionWidgetWidth / 1.5;

    return Container(
      margin: EdgeInsets.only(top: widget.topMargin, right: 16.0, left: 16.0),
      height: 170.0,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(28)),
          color: HexColor(widget.cardColor)),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 16.0, left: 14.0),
              child: Text(widget.cardTitle,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
              height: 26.0,
              width: double.infinity,
              margin: EdgeInsets.only(top: 16.0, left: 14.0, right: 22.0),
              decoration: BoxDecoration(
                  color: HexColor(widget.passMarkBgColor),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 26.0,
                    width: questionWidgetWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: HexColor(widget.questionsBgColor)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Questions: ' + widget.numOfQuestions,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor(widget.questionsTextColor)),
                      ),
                    ),
                  ),
                  Container(
                    height: 26.0,
                    width: questionWidgetWidth,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'PassMark: ' + widget.passMark,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor(widget.passMarkTextColor)),
                      ),
                    ),
                  ),
                ],
              )),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 26.0,
              width: startButtonWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(colors: widget.buttonGradientColor),
              ),
              margin: EdgeInsets.only(right: 22.0, bottom: 16.0),
              child: MaterialButton(
                onPressed: widget.onClick,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31)),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.only(right: 6.0, left: 6.0),
                    child: Text(
                      "START",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//  HexColor('#206454'),
//                   HexColor('#307665'),
//                   HexColor('#549384'),