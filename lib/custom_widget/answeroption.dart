import 'package:accudriver/model/answeroptionmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class AnswerOption extends StatefulWidget {
  double marginTop;

  double marginBottom;

  double marginLeftRight;

  String correctAnswer;

  Function onAnswerSelected;

  String option;

  AnswerOption(
      {Key? key,
      this.marginTop = 0.0,
      this.marginLeftRight = 0.0,
      this.marginBottom = 0.0,
      this.option = "",
      required this.onAnswerSelected,
      this.correctAnswer = ""})
      : super(key: key);

  @override
  _AnswerOptionState createState() => _AnswerOptionState();
}

class _AnswerOptionState extends State<AnswerOption> {


  @override
  Widget build(BuildContext context) {
    final answerOptionModel = Provider.of<AnswerOptionModel>(context);

    return 
       GestureDetector(
        onTap: () {
           print("onclicked");
           answerOptionModel.checkAnswerCorrectness(widget.option, widget.correctAnswer);
           answerOptionModel.setAnswerOptionProps(answerOptionModel.isCorrectAnswer);
           answerOptionModel.setAnswerClickState(true);
            
          },
        child: Consumer<AnswerOptionModel>(
          builder: (context, answerOptionModel, child) =>
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                top: widget.marginTop,
                bottom: widget.marginBottom,
                right: widget.marginLeftRight,
                left: widget.marginLeftRight),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(width: 2, color: answerOptionModel.borderColor)),
            child: Column(
              children: [
                Row(children: [
                  Flexible(
                    child: Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
                        child: Text(
                          'The quick brown fox jumped over the lazy dog',
                          style: TextStyle(color: answerOptionModel.textColor),
                        )),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(),
                      Visibility(
                        visible: answerOptionModel.isCorrectIconVisible,
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.check_circle,
                                color: HexColor('#8ECF94'))),
                      ),
                      Visibility(
                        visible: answerOptionModel.isWrongIconVisible,
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.highlight_off,
                              color: HexColor('#D86B6B'),
                            )),
                      ),
                    ],
                  )
                ])
              ],
            ),
          ),
        ),
         );
  }


  // _checkAnswerCorrectness() {
  //     if (widget.option == widget.correctAnswer) {
  //       widget._isCorrectAnswer = true;
  //     } else {
  //       widget._isCorrectAnswer = false;
  //     }
  // }

}
