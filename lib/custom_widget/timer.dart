import 'package:accudriver/custom_widget/timerpainter.dart';
import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  final double? parentHeight;
  final double? parentWidth;

  const Timer({ Key? key, this.parentHeight, this.parentWidth }) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with SingleTickerProviderStateMixin {
  
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    Tween<double> _radiusTween = Tween(begin: 360.0, end: 0.0);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomPaint(
          painter: TimerPainter(
            parentHeight: widget.parentHeight,
            parentWidth: widget.parentWidth
          ),
          child: Container(),
        ),
    );
  }
}