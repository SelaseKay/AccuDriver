import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TestCard extends StatefulWidget {
  final String cardColor;
  final String baseColor;
  final double topMargin;
  final String cardTitle;
  final String numOfQuestions;
  final String passMark;

  const TestCard(
      {Key? key,
      required this.cardColor,
      required this.baseColor,
      required this.topMargin,
      required this.cardTitle,
      required this.numOfQuestions,
      required this.passMark,})
      : super(key: key);

  @override
  _TestCardState createState() => _TestCardState();
}

class _TestCardState extends State<TestCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.topMargin, right: 16.0, left: 16.0),
      height: 150.0,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(21)),
          color: HexColor(widget.cardColor)),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 12.0, right: 8.0, left: 6.0),
            child: Text(widget.cardTitle,
                style: TextStyle(fontSize: 20.0, color: Colors.white)),
          ),
          Container(
            child: Row(
              children: <Widget>[

              ],
            )
          )
        ],
      ),
    );
  }
}
