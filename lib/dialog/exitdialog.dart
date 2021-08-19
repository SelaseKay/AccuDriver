import 'package:accudriver/assets/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

Future<bool> showExitDialog(BuildContext context) async {
  return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(Strings.exitTitle),
              content: Text(Strings.areYouSure),
              actions: [
                MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: HexColor('64B96D'),
                    child: Text(
                      Strings.cancel,
                      style: TextStyle(color: Colors.white),
                    )),
                MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: HexColor('#D86B6B'),
                    child: Text(
                      Strings.exit,
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            );
          }) ??
      false;
}
