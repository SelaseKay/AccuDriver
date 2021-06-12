import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:accudriver/assets/Strings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EFF7F8'),
      appBar: AppBar(
        backgroundColor: HexColor('#8981C5'),
        title: Text(Strings.appName),
      ),
      body: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0, bottom: 10.0),
                  decoration: BoxDecoration(
                      color: HexColor('#C2D8DD'),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
                        child: Text(Strings.waitTill,
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                      Container(
                        child: Image.asset(
                          'assets/images/car.png',
                          width: 220.0,
                          height: 220.0,
                          fit: BoxFit.scaleDown,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(bottom: 8.0, top: 30.0),
                  child: Row(
                    children: <Widget>[
                      Column(children: <Widget>[
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: HexColor('#364CD0'),
                          child: const Icon(Icons.edit),
                        ),
                        Container(
                          child: Text(
                            Strings.takeTest,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          margin: EdgeInsets.only(top: 8.0),
                        )
                      ]),
                      Column(children: <Widget>[
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: HexColor('#364CD0'),
                          child: const Icon(Icons.playlist_play),
                        ),
                        Container(
                          child: Text(
                            Strings.watchVideos,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          margin: EdgeInsets.only(top: 8.0),
                        )
                      ]),
                      Column(children: <Widget>[
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: HexColor('#364CD0'),
                          child: const Icon(Icons.follow_the_signs),
                        ),
                        Container(
                          child: Text(
                            Strings.learnSigns,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          margin: EdgeInsets.only(top: 8.0),
                        )
                      ])
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
    );
  }
}
