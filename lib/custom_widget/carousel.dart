import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class Carousel extends StatefulWidget {
  final List<Widget> images;
  final List<String> imageTexts;

  Carousel({Key? key, required this.images, required this.imageTexts})
      : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late Timer _timer;
  String _imageText = '';

  final double _defaultCarouselIndicatorSize = 7.0;
  final double _increasedCarouselIndicatorSize = 10.0;
  double _carouselIndicatorSize_1 = 7.0;
  double _carouselIndicatorSize_2 = 7.0;
  double _carouselIndicatorSize_3 = 7.0;
  Color _carouselIndicatorColor_1 = HexColor('#f0c68b');
  Color _carouselIndicatorColor_2 = Colors.white;
  Color _carouselIndicatorColor_3 = Colors.white;
  

  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(right: 20.0, left: 20.0),
          padding: EdgeInsets.all(24.0),
          height: 150.0,
          width: double.infinity,
          color: Colors.white,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
           itemBuilder: (context, index){
             return widget.images[index % 3];
           },
            onPageChanged: (int) {
              if (int == 0) {
                setState(() {
                  _imageText = widget.imageTexts[0];
                  _carouselIndicatorSize_1 = _increasedCarouselIndicatorSize;
                  _carouselIndicatorSize_2 = _defaultCarouselIndicatorSize;
                  _carouselIndicatorSize_3 = _defaultCarouselIndicatorSize;
                  _carouselIndicatorColor_1 = HexColor('#f0c68b');
                  _carouselIndicatorColor_2 = Colors.white;
                  _carouselIndicatorColor_3 = Colors.white;
                });
              } else if (int == 1) {
                setState(() {
                  _imageText = widget.imageTexts[1];
                   _carouselIndicatorSize_1 = _defaultCarouselIndicatorSize;
                  _carouselIndicatorSize_2 = _increasedCarouselIndicatorSize;
                  _carouselIndicatorSize_3 = _defaultCarouselIndicatorSize;
                  _carouselIndicatorColor_1 = Colors.white;
                  _carouselIndicatorColor_2 = HexColor('#f0c68b');
                  _carouselIndicatorColor_3 = Colors.white;
                });
              } else if (int == 2) {
                setState(() {
                  _imageText = widget.imageTexts[2];
                   _carouselIndicatorSize_1 = _defaultCarouselIndicatorSize;
                  _carouselIndicatorSize_2 = _defaultCarouselIndicatorSize;
                  _carouselIndicatorSize_3 = _increasedCarouselIndicatorSize;
                  _carouselIndicatorColor_1 = Colors.white;
                  _carouselIndicatorColor_2 = Colors.white;
                  _carouselIndicatorColor_3 = HexColor('#f0c68b');
                });
              }
            },
          ),
        ),
        AnimatedContainer(
            margin: EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            alignment: Alignment.center,
            duration: Duration(milliseconds: 200),
            width: double.infinity,
            child: Text(
              _imageText,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            )),
        Container(
          margin: EdgeInsets.only(top: 6.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Spacer(
              flex: 16,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: _carouselIndicatorSize_1,
              height: _carouselIndicatorSize_1,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.0),
                  color: _carouselIndicatorColor_1,
                  shape: BoxShape.circle),
            ),
            Spacer(
              flex: 1,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: _carouselIndicatorSize_2,
              height: _carouselIndicatorSize_2,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.0),
                  color: _carouselIndicatorColor_2,
                  shape: BoxShape.circle),
            ),
            Spacer(flex: 1),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: _carouselIndicatorSize_3,
              height: _carouselIndicatorSize_3,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.0),
                  color: _carouselIndicatorColor_3,
                  shape: BoxShape.circle),
            ),
            Spacer(flex: 16)
          ]),
        ),
      ],
    );
  }
}
