import 'package:accudriver/assets/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Future<void> showScoreDialog(BuildContext context, String content) async{
  return showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text(Strings.score),
      content: Text(content),
      actions: [
        MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: HexColor('64B96D'),
              child: Text(
                Strings.ok,
                style: TextStyle(color: Colors.white),
              ),
            )
      ],
    );
  });
}