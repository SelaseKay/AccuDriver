import 'package:accudriver/model/state/answeroptionstates.dart';
import 'package:accudriver/model/answeroptionmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AnswerOption extends StatelessWidget {
  double marginTop;

  double marginBottom;

  double marginLeftRight;

  String correctAnswer;

  AnswerOptionState answerOptionState;

  Function onAnswerSelected;

  String option;

  AnswerOption(
      {Key? key,
      this.marginTop = 0.0,
      this.marginLeftRight = 0.0,
      this.marginBottom = 0.0,
      this.option = "",
      required this.answerOptionState,
      required this.onAnswerSelected,
      this.correctAnswer = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _answerOptionModel = Provider.of<AnswerOptionModel>(context);

    HexColor _borderColor = answerOptionState.borderColor;
    HexColor _textColor = answerOptionState.textColor;
    bool _isCorrectIconVisible = answerOptionState.isCorrectIconVisible;
    bool _isWrongIconVisible = answerOptionState.isWrongIconVisible;

    return GestureDetector(
      onTap: () {
        print("onclicked");
        _answerOptionModel.checkAnswerCorrectness(
            option, correctAnswer);
        _answerOptionModel.setAnswerClickState(true);
        onAnswerSelected(_answerOptionModel.isCorrectAnswer, true);
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: marginTop,
            bottom: marginBottom,
            right: marginLeftRight,
            left: marginLeftRight),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(width: 2, color: _borderColor)),
        child: Column(
          children: [
            Row(children: [
              Flexible(
                child: Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
                    child: Text(
                      'The quick brown fox jumped over the lazy dog',
                      style: TextStyle(color: _textColor),
                    )),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(),
                  Visibility(
                    visible: _isCorrectIconVisible,
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.check_circle,
                            color: HexColor('#8ECF94'))),
                  ),
                  Visibility(
                    visible: _isWrongIconVisible,
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
    );
  }
}
