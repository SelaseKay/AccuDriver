import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

// ignore: must_be_immutable
class AnswerOption extends StatefulWidget {
  double marginTop;
  double marginBottom;
  double marginLeftRight;
  bool? isCorrectIconVisible;
  bool? isWrongIconVisible;
  HexColor _borderColor = HexColor('#E1E1E1');
  HexColor _textColor = HexColor('#535353');

  AnswerOption({Key? key, this.marginTop = 0.0, this.marginLeftRight = 0.0, this.isCorrectIconVisible, this.isWrongIconVisible, this.marginBottom = 0.0})
      : super(key: key);

  @override
  _AnswerOptionState createState() => _AnswerOptionState();
}

class _AnswerOptionState extends State<AnswerOption> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onAnwerOptionClicked,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: widget.marginTop,
            bottom: widget.marginBottom,
            right: widget.marginLeftRight,
            left: widget.marginLeftRight),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(width: 2, color: widget._borderColor)),
        child: Column(
          children: [
            Row(children: [
              Flexible(
                child: Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
                    child: Text(
                        'The quick brown fox jumped over the lazy dog aaaaaaaaaaaaaa', style: TextStyle(
                          color: widget._textColor
                        ),)
                        ),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: 
                [
                Container(),
                Visibility(
                  visible: widget.isCorrectIconVisible!,
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.check_circle, color: HexColor('#8ECF94'))),
                ),  
                Visibility(
                  visible: widget.isWrongIconVisible!,
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.highlight_off, color: HexColor('#D86B6B'),)),
                ),
                ],
              )
            ])
          ],
        ),
      ),
    );
  }

  _onAnwerOptionClicked(){
    setState(() {
      
        widget.isCorrectIconVisible = false;
        widget.isWrongIconVisible = true;
        widget._borderColor = HexColor('#D86B6B');
        widget._textColor = HexColor('#D86B6B');
    });
  }
}
