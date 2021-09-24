import 'package:flutter/cupertino.dart';

class ScoreModel extends ChangeNotifier{

  int _scoreId = 0;
  int get scoreId => _scoreId;

  void setCurrentScoreId(int scoreId){
    _scoreId = scoreId;
    notifyListeners();
  }

}