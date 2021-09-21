import 'package:accudriver/roadsign.dart';
import 'package:flutter/material.dart';

class Signcard extends StatelessWidget {
  final RoadSign roadsign;
  Signcard({required this.roadsign});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: GestureDetector(
              onTap: (){
                
              },
            ),
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
               image: AssetImage(roadsign.signImage),
                fit: BoxFit.contain,
              ),
            ),
            
          ),
        ),
        Text(
          roadsign.signName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.normal,
             fontSize: 15,
             ),
        )
      ],
    );
  }
}
