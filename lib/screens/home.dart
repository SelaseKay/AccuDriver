// ignore: import_of_legacy_library_into_null_safe
import 'package:accudriver/screens/testcategories.dart';
import 'package:accudriver/screens/videoscreen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:accudriver/assets/Strings.dart';
import 'package:accudriver/custom_widget/carousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(Strings.appName, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Carousel(
              images: [
                Image.asset(
                  'assets/images/test_drive.png',
                ),
                Image.asset(
                  'assets/images/car_small.png',
                ),
                Image.asset('assets/images/drunk_driving_image.jpg')
              ],
              imageTexts: [
                Strings.waitTill,
                Strings.learnWithVids,
                Strings.driveSafe
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 18.0, right: 8.0, left: 8.0),
              height: 190.0,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  HexColor('#71C0F5'),
                  HexColor('#45A5E5'),
                  HexColor('#0A80CF'),
                ]),
                borderRadius: BorderRadius.all(Radius.circular(31)),
              ),
              child: MaterialButton(
                onPressed: _navigateToTestCategories,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31)),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16.0, left: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                Strings.takeTest,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                              child: Image.asset(
                            'assets/images/take_exams.png',
                          )),
                        ]),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 190.0,
                        width: 170.0,
                        child: MaterialButton(
                          elevation: 0.0,
                          disabledElevation: 0.0,
                          focusElevation: 0.0,
                          hoverElevation: 0.0,
                          animationDuration: Duration(milliseconds: 200),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(31)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return videoscreen();
                                },
                              ),
                            );
                          },
                          color: HexColor('#00C177'),
                          height: double.infinity,
                          minWidth: double.infinity,
                          child: Ink.image(
                            height: double.infinity,
                            width: double.infinity,
                            image:
                                AssetImage('assets/images/learn_with_vids.png'),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          Strings.watchVideos,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 190.0,
                        width: 170.0,
                        child: MaterialButton(
                          elevation: 0.0,
                          disabledElevation: 0.0,
                          focusElevation: 0.0,
                          hoverElevation: 0.0,
                          animationDuration: Duration(milliseconds: 200),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(31)),
                          onPressed: () {},
                          color: HexColor('#71C3CE'),
                          height: double.infinity,
                          minWidth: double.infinity,
                          child: Ink.image(
                            height: double.infinity,
                            width: double.infinity,
                            image:
                                AssetImage('assets/images/learn_signs_2.jpg'),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          Strings.learnSigns,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToTestCategories() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TestCategories()));
  }
}
