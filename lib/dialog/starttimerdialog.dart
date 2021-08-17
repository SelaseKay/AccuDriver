import 'package:accudriver/assets/Strings.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Future<void> showBeginTimerdialog(BuildContext context, Function onStartPressed) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(Strings.ready),
            content: Text(Strings.tapOnStart),
            actions: [
              MaterialButton(
                onPressed: () {
                  onStartPressed();
                  Navigator.of(context).pop();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: HexColor('64B96D'),
                child: Text(
                  Strings.start,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        );
      });
}
