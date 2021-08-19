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
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(roadsign.signImage),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Text(
          roadsign.signName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
}
