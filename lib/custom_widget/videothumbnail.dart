import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class VideoThumnail extends StatelessWidget {
  final double height;
  final double marginTop;
  final double marginBottom;
  final String imageName;
  final String heroNumber;
  final String imageDescription;

  const VideoThumnail(
      {Key? key,
      required this.height,
      this.marginTop = 0.0,
      this.marginBottom = 0.0,
      required this.imageName,
      required this.heroNumber,
      required this.imageDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      child: Column(children: [
        Hero(
          tag: "video$heroNumber",
          child: Container(
            height: height,
            width: double.infinity,
            margin: EdgeInsets.only(right: 16.0, left: 16.0),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
                image: DecorationImage(
                    image: AssetImage("assets/images/$imageName"),
                    fit: BoxFit.fill)),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 16.0, left: 16.0),
          decoration: BoxDecoration(
            color: HexColor("#F2F2F2"),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0)),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(top: 8.0, left: 16.0, bottom: 8.0),
              child: Text(
                imageDescription,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
