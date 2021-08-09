import 'package:accudriver/custom_widget/timerpainter.dart';
import 'package:accudriver/dialog/timeupdialog.dart';
import 'package:accudriver/model/timermodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Timer extends StatefulWidget {
  final double? parentHeight;
  final double? parentWidth;

  Function onTimeUp;

  Timer({Key? key, this.parentHeight, this.parentWidth, required this.onTimeUp})
      : super(key: key);

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

    controller.addListener(() {
      if (animation.isCompleted) {
        widget.onTimeUp(animation.value);
      }
    });

    // controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
