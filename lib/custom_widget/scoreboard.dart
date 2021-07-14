import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class ScoreBoard extends StatefulWidget {
  final double questionViewWidth;
  final double timerSize;
  String leftText;
  String rightText;
  HexColor? barColor;

  ScoreBoard(
      {Key? key,
      required this.questionViewWidth,
      required this.timerSize,
      this.leftText = '',
      this.rightText = '',
      this.barColor})
      : super(key: key);

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  @override
  Widget build(BuildContext context) {
    final double barPaddings = 26;
    final double maxWidthOfBar =
        (widget.questionViewWidth / 2) - (widget.timerSize / 2) - barPaddings;

    return Container(
        child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 8.0, top: 16.0),
          child: Text(
            '${widget.leftText}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              color: widget.barColor,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 6.0, top: 16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: widget.barColor),
          height: 6.0,
          width: maxWidthOfBar,
        ),
        Container(
          margin: EdgeInsets.only(left: 8.0, top: 16.0),
          child: Text(
            '${widget.rightText}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              color: HexColor('#8ECF94'),
            ),
          ),
        ),
      ],
    ));
  }
}
