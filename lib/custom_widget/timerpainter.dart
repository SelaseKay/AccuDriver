import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TimerPainter extends CustomPainter with ChangeNotifier {
  final double? parentHeight;
  final double? parentWidth;
  final double animatedValue;
  int _timeElapsed = 0;

  TimerPainter(
      {this.parentHeight, this.parentWidth, required this.animatedValue});

  @override
  void paint(Canvas canvas, Size size) {
    var bgPaint = _buildPaintObj(Colors.white, PaintingStyle.fill);
    Paint paint = _buildPaintObj(HexColor('#8641CC'), PaintingStyle.stroke, 5.0);

    _drawTimerBg(bgPaint, canvas);
    _drawTimerProgress(paint, canvas);

    

    // TextSpan span = TextSpan(
    //     style: TextStyle(
    //         color: HexColor('#A179C9'),
    //         fontWeight: FontWeight.bold,
    //         fontSize: 18.0),
    //     text: '$_timeElapsed');

    // TextPainter tp = TextPainter(text: span, textAlign: TextAlign.end, textDirection: TextDirection.ltr);
    // tp.layout();
    // tp.paint(canvas, Offset((parentHeight! / 2) - (18 / 2), (parentWidth! / 2) - (18 / 2)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  _buildPaintObj(Color color, PaintingStyle paintingStyle,
      [double strokeWidth = 0.0]) {
    var paint = Paint()
      ..color = color
      ..style = paintingStyle
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true;
    return paint;
  }

  _drawText() {}

  _drawTimerBg(Paint paint, Canvas canvas) {
    var c = Offset(parentWidth! / 2, parentHeight! / 2);
    canvas.drawCircle(c, parentWidth! / 2, paint);
  }

  _drawTimerProgress(Paint paint, Canvas canvas) {
      if(animatedValue % 1 != 0){
      _timeElapsed = animatedValue.toInt();
      if(_timeElapsed >= 20){
        paint.color = Colors.red;
      }
    }

    var rect = Rect.fromLTRB(paint.strokeWidth, paint.strokeWidth,
        parentWidth! - paint.strokeWidth, parentHeight! - paint.strokeWidth);
    canvas.drawArc(rect, _getRadianValue(),
        _getRadianValue(_convertToDegrees(animatedValue)), false, paint);
  }

  _getRadianValue([double degreeValue = 270]) {
    return degreeValue * (pi / 180);
  }

  _convertToDegrees(double value) {
    var degree = (value / 30) * 360;
    return degree;
  }
}
