import 'package:accudriver/assets/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

Future<void> showTimeUpDialog(
    BuildContext context, Function onNextPressed) async {
  return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Strings.timeUp),
          content: (Text(Strings.timeIsUp)),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
                onNextPressed();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: HexColor('64B96D'),
              child: Text(
                Strings.next,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
          elevation: 20.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
      });
}
