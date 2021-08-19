import 'package:flutter/material.dart';

class TestBtns extends StatefulWidget {
  const TestBtns({ Key? key }) : super(key: key);

  @override
  _TestBtnsState createState() => _TestBtnsState();
}

class _TestBtnsState extends State<TestBtns> {

  bool a1 = false, a2 = false, a3 = false;

  void disable() {
    a1 = true;
    a2 = true;
    a3 = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AbsorbPointer(absorbing: a1, child: ElevatedButton(onPressed: () {
            setState(() {
              print("a1");
              disable();
            });
          }, child: Text("Button 1"))),
          AbsorbPointer(absorbing: a2, child: ElevatedButton(onPressed: () {
            setState(() {
              print("a2");
              disable();
            });
          }, child: Text("Button 2"))),
          AbsorbPointer(absorbing: a3, child: ElevatedButton(onPressed: () {
            setState(() {
              print("a3");
              disable();
            });
          }, child: Text("Button 3"))),
        ],
      ),
    );
  }
}