import 'package:accudriver/assets/Strings.dart';
import 'package:accudriver/custom_widget/currentscore.dart';
import 'package:accudriver/database/scoredb.dart';
import 'package:accudriver/model/score..dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ScoreDb.instance.scores(),
          builder: (BuildContext context, AsyncSnapshot<List<Score>> scores) {
            if (scores.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CurrentScore(
                        currentScore: scores.data!.length == 0
                            ? "No Score"
                            : scores.data![scores.data!.length].toString()),
                    Container(
                      height: 1.0,
                      color: HexColor("#D9D9D9"),
                      width: double.infinity,
                      margin:
                          EdgeInsets.only(top: 8.0, right: 16.0, left: 16.0),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(top: 32.0, left: 16.0),
                          child: Text(Strings.recentScore,
                              style: TextStyle(
                                  color: HexColor("#A1A1A1"),
                                  fontWeight: FontWeight.w400))),
                    ),
                    ListView.builder(
                        itemCount: scores.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(scores.data![index].score),
                          );
                        })
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
