import 'package:accudriver/model/score..dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ScoreDb{

  static Database? _database;

  ScoreDb._internal();

  static final ScoreDb _db = ScoreDb._internal();

  static ScoreDb get instance => _db;

  Future<Database?> get database async{
    if(_database != null)
      return _database;
    _database = await _init();
    return _database;
  }

  Future<Database> _init() async{
     return await openDatabase(join(await getDatabasesPath(), 'score_db.db'),
       onCreate: (db, version) {
          db.execute(
           "CREATE TABLE scores(scoreId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, score TEXT);",
         );
       },

       version: 5,
     );
  }

  Future<int> insert(Score score) async{
    var db = await ScoreDb.instance.database;
    return await db!.insert("scores", score.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> update(Score newScore, int id) async{
    var db = await ScoreDb.instance.database;
    db!.update("scores", newScore.toMap(), where: 'scoreId = ?', whereArgs: [id]);
  }

  Future<List<Score>> scores() async {

  final db = await ScoreDb.instance.database;

  final List<Map<String, dynamic>> maps = await db!.query('scores');

  return List.generate(maps.length, (i) {
    return Score(
      scoreId: maps[i]['scoreId'],
      score: maps[i]['score']
    );
  });
}
}