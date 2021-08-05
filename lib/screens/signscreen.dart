import 'package:flutter/material.dart';

class signscreen extends StatelessWidget {
  const signscreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
      /*  Container(
          padding: EdgeInsets.all(50),
          margin: EdgeInsets.all(8),
          child: Image.asset(
            'assets/images/learn_signs_2.jpg'),),*/
            Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/learn_signs_2.jpg'),
                    fit: BoxFit.fitWidth,
                  ),),),
            ),
            Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/learn_signs_2.jpg'),
                    fit: BoxFit.fitWidth,
                    ),),
            ),
            )
      ],
    );
  }
}