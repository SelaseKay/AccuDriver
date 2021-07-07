import 'package:accudriver/assets/Strings.dart';
import 'package:accudriver/custom_widget/testcard.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TestCategories extends StatelessWidget {
  const TestCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#8E98D2'),
          centerTitle: true,
          title: Text(
            Strings.testCategories,
          ),
          elevation: 0.0,
        ),
        backgroundColor: HexColor('#8E98D2'),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(31), topRight: Radius.circular(31)),
          ),
          child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                TestCard(
                    cardColor: '#31B1EE',
                    baseColor: '#31B1EE',
                    topMargin: 20.0,
                    cardTitle: Strings.generalKnowledgeOnDriving,
                    numOfQuestions: '10',
                    passMark: '70%'),
                TestCard(
                    cardColor: '#DFC2C0',
                    baseColor: '#DFC2C0',
                    topMargin: 16.0,
                    cardTitle: Strings.howMuchDoYouKnowAboutSigns,
                    numOfQuestions: '10',
                    passMark: '70%'),
                TestCard(
                    cardColor: '#CBC889',
                    baseColor: '#CBC889',
                    topMargin: 16.0,
                    cardTitle: Strings.testYourSelfOnYourCar,
                    numOfQuestions: '10',
                    passMark: '70%')
              ])),
        ),
      ),
    );
  }
}
