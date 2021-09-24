import 'package:accudriver/assets/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class CurrentScore extends StatefulWidget {
  final String currentScore;

  const CurrentScore({Key? key, required this.currentScore}) : super(key: key);

  @override
  State<CurrentScore> createState() => _CurrentScoreState();
}

class _CurrentScoreState extends State<CurrentScore> {
  HexColor _scoreColor = HexColor("#76E97C");

  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: statusBarHeight + 32.0),
            child: Text(
              _inspectCurrentScore(widget.currentScore),
              style: TextStyle(
                  color: _scoreColor, //green color
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 8.0),child: Text(Strings.currentScore, style: TextStyle(color: HexColor("#A1A1A1"), fontWeight: FontWeight.bold),))
      ],
    );
  }


  String _inspectCurrentScore(String score){
    var currentScore;
    if (_isNumeric(score)){
       currentScore = double.parse(score);
       if (currentScore >= 60.00){
         setState(() {
           _scoreColor = HexColor("#76E97C");
         });
       }
       else if(currentScore >= 49){
         setState(() {
           _scoreColor = HexColor("#D2E22E");
         });
       }
       else{
         setState(() {
            _scoreColor = HexColor("#F5574A");
         });
       }
       currentScore = score.toString();
    }
    return currentScore;
  }

  bool _isNumeric(string) => num.tryParse(string) != null;

}
