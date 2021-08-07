import 'package:accudriver/assets/Strings.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Future<void> showNextDialog(
    AnimationController controller, BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Strings.noOptSelected),
          content: (Text(Strings.selectOpt)),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                controller.forward();
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
          elevation: 20.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
      });
}
