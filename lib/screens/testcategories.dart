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
          backgroundColor: HexColor('#6399D9'),
          centerTitle: true,
          title: Text(
            Strings.testCategories,
          ),
          elevation: 0.0,
        ),
        backgroundColor: HexColor('#6399D9'),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 16.0),
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
                    cardColor: '#6ACAAD',
                    topMargin: 30.0,
                    passMarkBgColor: '#9ED9C7',
                    questionsBgColor: '#C6F5EB',
                    questionsTextColor: '#549384',
                    passMarkTextColor: '#00CA8D',
                    buttonGradientColor: [
                      HexColor('#1D5749'),
                      HexColor('#216A58'),
                      HexColor('#307665'),
                      HexColor('#549384'),
                    ],
                    cardTitle: Strings.generalKnowledgeOnDriving,
                    numOfQuestions: '10',
                    passMark: '70%'),
                TestCard(
                    cardColor: '#4E96AE',
                    topMargin: 24.0,
                    passMarkBgColor: '#7ABCD2',
                    questionsBgColor: '#9DDAE9',
                    questionsTextColor: '#316577',
                    passMarkTextColor: '#0089B7',
                    buttonGradientColor: [
                      HexColor('#1D5263'),
                      HexColor('#255C68'),
                      HexColor('#2E666D'),
                      HexColor('#4D93A4'),
                    ],
                    cardTitle: Strings.howMuchDoYouKnowAboutSigns,
                    numOfQuestions: '10',
                    passMark: '70%'),
                TestCard(
                    cardColor: '#908D5C',
                    topMargin: 24.0,
                    passMarkBgColor: '#B1AE7E',
                    questionsBgColor: '#E4E2B6',
                    questionsTextColor: '#66643C',
                    passMarkTextColor: '#938A00',
                    buttonGradientColor: [
                      HexColor('#6B6715'),
                      HexColor('#686E26'),
                      HexColor('#63763C'),
                      HexColor('#838C5F'),
                    ],
                    cardTitle: Strings.testYourSelfOnYourCar,
                    numOfQuestions: '10',
                    passMark: '70%'),
              ])),
        ),
      ),
    );
  }
}
