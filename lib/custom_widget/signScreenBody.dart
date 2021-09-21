import 'package:accudriver/custom_widget/signcard.dart';
import 'package:accudriver/roadsign.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class signScreenBody extends StatelessWidget {
  const signScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Common Road Signs'),
      ),
      // backgroundColor: Colors.transparent,
      body: Column(
        
        children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              itemCount: signs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8),
              itemBuilder: (context, index) => Signcard(roadsign: signs[index]),
            ),
          ),
        ),
      ]),
    );
  }
}

