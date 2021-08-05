import 'dart:math';

import 'package:accudriver/model/timermodel.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TimerPainter extends CustomPainter with ChangeNotifier {
  final double? parentHeight;
  final double? parentWidth;
  final double animatedValue;
  Function onTimeLeftChanged;
  int _timeLeft = 29;
  int _oldAnimatedValue = 0;

  TimerPainter(
      {this.parentHeight,
      this.parentWidth,
      required this.animatedValue,
      required this.onTimeLeftChanged});

  @override
  void paint(Canvas canvas, Size size) {
    var bgPaint = _buildPaintObj(Colors.white, PaintingStyle.fill);
    Paint timerCirclePaint = _buildPaintObj(
        HexColor('#8641CC'), PaintingStyle.stroke,
        strokeWidth: 5.0);
    Paint timerPaint =
        _buildPaintObj(Colors.white, PaintingStyle.stroke, strokeWidth: 7.0);

    _drawTimerBg(bgPaint, canvas);
    _drawTimerCircle(timerCirclePaint, canvas);
    _drawTimerProgress(timerPaint, canvas);

    _drawText(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  _buildPaintObj(Color color, PaintingStyle paintingStyle,
      {double strokeWidth = 0.0,
      BlendMode blendMode = BlendMode.srcOver,
      StrokeCap strokeCap = StrokeCap.round}) {
    var paint = Paint()
      ..color = color
      ..style = paintingStyle
      ..strokeCap = strokeCap
      ..strokeWidth = strokeWidth
      ..blendMode = blendMode
      ..isAntiAlias = true;

    return paint;
  }

  _drawText(Canvas canvas) {
    TextSpan span = TextSpan(
        style: TextStyle(
            color: HexColor('#A179C9'),
            fontWeight: FontWeight.bold,
            fontSize: 18.0),
        text: '$_timeLeft');

    TextPainter tp = TextPainter(
        text: span, textAlign: TextAlign.end, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(
        canvas,
        Offset((parentHeight! / 2) - tp.width / 2,
            (parentWidth! / 2) - tp.width / 2));
  }

  _drawTimerBg(Paint paint, Canvas canvas) {
    var c = Offset(parentWidth! / 2, parentHeight! / 2);
    canvas.drawCircle(c, parentWidth! / 2, paint);
  }

  _drawTimerCircle(Paint paint, Canvas canvas) {
    //check if animated value is between 0.0 and 30.0(excluding 0.0 and 30.0)
    if (animatedValue % 1 != 0) {
      // check if animation is not paused
      if (_oldAnimatedValue != animatedValue.toInt()) {
        _timeLeft = _timeLeft - animatedValue.toInt();
        _oldAnimatedValue = animatedValue.toInt();
      }
      if (_timeLeft <= 10) {
        paint.color = Colors.red;
      }
    } else {
      if (animatedValue.toInt() == 30) {
        _timeLeft = 0;
        onTimeLeftChanged(_timeLeft);
      } else {
        _timeLeft = 29;
      }
    }

    var rect = Rect.fromLTRB(paint.strokeWidth, paint.strokeWidth,
        parentWidth! - paint.strokeWidth, parentHeight! - paint.strokeWidth);

    canvas.drawArc(rect, _getRadianValue(), _getRadianValue(360), false, paint);
  }

  _drawTimerProgress(Paint paint, Canvas canvas) {
    var rect = Rect.fromLTRB(5, 5, parentWidth! - 5, parentHeight! - 5);

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
