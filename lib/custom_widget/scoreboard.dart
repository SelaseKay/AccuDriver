import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class ScoreBoard extends StatefulWidget {
  final double questionViewWidth;
  final double timerSize;
  String leftText;
  String rightText;
  HexColor? barColor;

  double marginTop;
  double marginLeft;
  double marginRigt;

  double barMarginTop;
  double barMarginLeft;
  double barMarginRight;
  

  ScoreBoard(
      {Key? key,
      required this.questionViewWidth,
      required this.timerSize,
      this.leftText = '',
      this.rightText = '',
      this.barColor,
      this.marginLeft = 0.0,
      this.marginRigt = 0.0,
      this.marginTop = 0.0,
      this.barMarginLeft = 0.0,
      this.barMarginRight = 0.0,
      this.barMarginTop = 0.0
      })
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
          margin: EdgeInsets.only(left: widget.marginLeft, top: widget.marginTop),
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
          margin: EdgeInsets.only(left: 6.0, top: widget.marginTop),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: widget.barColor),
          height: 6.0,
          width: maxWidthOfBar,
        ),
        Container(
          margin: EdgeInsets.only(left: 6.0, top: widget.marginTop),
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
