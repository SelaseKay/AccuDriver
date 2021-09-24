class Score{
  int? scoreId;
  String score;

  Score({
    this.scoreId,
    this.score = ""
  });

   Map<String, dynamic> toMap() {
    return {
      'scoreId': scoreId,
      'score': score
    };
  }
}