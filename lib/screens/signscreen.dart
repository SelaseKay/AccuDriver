import 'package:flutter/material.dart';

// ignore: camel_case_types
class signscreen extends StatefulWidget {
  const signscreen({Key? key}) : super(key: key);

  @override
  _signscreenState createState() => _signscreenState();
}

// ignore: camel_case_types
class _signscreenState extends State<signscreen> {
  final List<String> _listItem = [
    'assets/images/roundabout.jpg',
    'assets/images/noentry.jpg',
    'assets/images/speedlimit.jpg',
    'assets/images/menatwork.jpg',
    'assets/images/lefthandcurve.jpg',
    'assets/images/narrowroad.jpg',
    'assets/images/narrowroad2.jpg',
    'assets/images/pedestriancrossing.jpg',
    'assets/images/donotenter.jpg',
    'assets/images/nocarsallowed.jpg',
    'assets/images/norightturn.jpg',
    'assets/images/stop.jpg',
    'assets/images/nouturn.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'ROAD SIGNS',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 30,
              height: 30,
              child: Center(child: Text('')),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 100,
                /*decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                      image: AssetImage('assets/images/accudrive.jpg'),
                      fit: BoxFit.cover),
                ),*/
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/accudrive.jpg'),
                  backgroundColor: Colors.white,
                  // maxRadius: 65.0,
                  radius: 20,
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Common Road Signs',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(20),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: _listItem
                      .map((item) => Card(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(item),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
