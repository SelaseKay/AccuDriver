import 'package:accudriver/custom_widget/timerpainter.dart';
import 'package:accudriver/model/timermodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Timer extends StatefulWidget {
  final double? parentHeight;
  final double? parentWidth;

  Timer({Key? key, this.parentHeight, this.parentWidth}) : super(key: key);

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
      duration: Duration(milliseconds: 30000),
    );

    Tween<double> _radiusTween = Tween(begin: 0.0, end: 30.0);

    animation = _radiusTween.animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _timerModel = Provider.of<TimerModel>(context);

    _timerModel.setController(controller);
    return Container(
      child: CustomPaint(
        painter: TimerPainter(
            parentHeight: widget.parentHeight,
            parentWidth: widget.parentWidth,
            animatedValue: animation.value),
      ),
    );
  }
}
