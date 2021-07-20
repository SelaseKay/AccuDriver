import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CurrentQuestionIndicator extends StatefulWidget {
  String currentQuestionNum;
  String totalQuestionNum;
  double questionViewWidth;

  CurrentQuestionIndicator(
      {Key? key,
      this.currentQuestionNum = '',
      this.totalQuestionNum = '',
      required this.questionViewWidth})
      : super(key: key);

  @override
  _CurrentQuestionIndicatorState createState() =>
      _CurrentQuestionIndicatorState();
}

class _CurrentQuestionIndicatorState extends State<CurrentQuestionIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.questionViewWidth,
      margin: EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Spacer(
            flex: 2,
          ),
          Text(
            'Question ',
            style: TextStyle(color: HexColor('#A179C9'), fontSize: 12.0),
          ),
          Text('${widget.currentQuestionNum}',
              style: TextStyle(
                  color: HexColor('#A179C9'),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold)),
          Text(
            '/${widget.totalQuestionNum}',
            style: TextStyle(color: HexColor('#A179C9'), fontSize: 12.0),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
