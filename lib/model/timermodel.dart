import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';

class TimerModel extends ChangeNotifier{
  AnimationController? _controller;
  AnimationController? get controller => _controller;

  setController(AnimationController controller) {
    _controller = controller;
  }

}