import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PurpleBackground extends StatefulWidget {
  final double marginTop;
  final double height;

  const PurpleBackground({Key? key, required this.marginTop, required this.height}) : super(key: key);

  @override
  _PurpleBackgroundState createState() => _PurpleBackgroundState();
}

class _PurpleBackgroundState extends State<PurpleBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 8.0, right: 8.0, top: widget.marginTop),
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: HexColor('#9F75C8'),
        borderRadius: BorderRadius.all(Radius.circular(31)),
      ),
    );
  }
}

//marginTop = statusBarHeight + statusBarHeight / 2
//height = questionBacgroundHeight