import 'dart:io';

import 'package:accudriver/model/question.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class QuestionDb {
  Future<Database>? _database;

  QuestionDb._questionDbConstructor();
  static final QuestionDb instance = QuestionDb._questionDbConstructor();

  List<Question> _questions = List.empty();


  initDb() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "quizquestions.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data =
          await rootBundle.load(join("assets/db", "quizquestions.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
// open the database
      var temp = _database;
      if (temp == null){
        _database = openDatabase(path, readOnly: true);
      }
      else{
        _database = temp;
      }
      return _database;
  }

  Future<List<Question>> getQuestions() async {
    final db = await initDb();
    final List<Map<String, dynamic>> maps = await db.query('Questions');

    _questions = List.generate(maps.length, (i) {
      return Question(
          questionId: maps[i]['QuestionId'],
          questionText: maps[i]['QuestionString'],
          optionA: maps[i]['QuestionOptionA'],
          optionB: maps[i]['QuestionOptionB'],
          optionC: maps[i]['QuestionOptionC'],
          optionD: maps[i]['QuestionOptionD'],
          correctAnswer: maps[i]['CorrectAnswer'],
          questionImage: maps[i]['QuestionImg']);
    });
    return _questions;
  }

  closeDb() async {
    final db = await _database;
    _database = null;
    db!.close();
  }
}
