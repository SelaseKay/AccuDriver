import 'package:accudriver/assets/Strings.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NextButton extends StatelessWidget {
  final Function onPressed;

  const NextButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      width: 74.0,
        margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: MaterialButton(
          onPressed: () => onPressed(),
          child: Text(Strings.next, style: TextStyle(color: Colors.white),),
          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
          color: HexColor('#408EE9'),
          height: 10.0,
        ));
  }
}
