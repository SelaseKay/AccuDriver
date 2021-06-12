import 'package:accudriver/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:accudriver/assets/Strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
    );
  }
}
