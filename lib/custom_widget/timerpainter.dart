import 'package:flutter/material.dart';

class TimerPainter extends CustomPainter with ChangeNotifier {
  final double? parentHeight;
  final double? parentWidth;

  late Function onChangeNotifier;

  TimerPainter({this.parentHeight, this.parentWidth});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.yellow
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    var bgPaint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    var c = Offset(parentWidth! / 2, parentHeight! / 2);
    canvas.drawCircle(c, parentWidth! / 2, bgPaint);

    var rect = Rect.fromLTRB(paint.strokeWidth, paint.strokeWidth,
        parentWidth! - paint.strokeWidth, parentHeight! - paint.strokeWidth);
    canvas.drawArc(rect, 2.35, 4.71, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  _setOnChangeNotifier(Function onChangeNotifier) {
    this.onChangeNotifier = onChangeNotifier;
  }
}
