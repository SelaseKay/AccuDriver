
import 'dart:async';

import 'package:accudriver/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

void main() {
  runApp(AccuDriver());
}

class AccuDriver extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  // ignore: override_on_non_overriding_member
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: HexColor("#6C77BB"),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'AccuDriver',
                          style: TextStyle(
                              fontFamily: 'Dancing Script',
                              //fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 65.0,
                        backgroundImage: AssetImage('assets/images/accudrive.jpg'),
                      ),
                      SizedBox(
                        height: 100.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'AccuDriver, the smart choice!!!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Dancing Script',
                                  fontSize: 16.0),
                              textAlign: TextAlign.center,
                            ),
                          ],
                          //alignment: Alignment(0.0,5.0),
                          // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.green,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
