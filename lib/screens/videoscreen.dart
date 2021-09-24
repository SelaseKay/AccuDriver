import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:video_player/video_player.dart';
//import 'package:flutter/material.dart';

void main() => runApp(videoscreen());

// ignore: camel_case_types
class videoscreen extends StatefulWidget {
  @override
  _videoscreenState createState() => _videoscreenState();
}

// ignore: camel_case_types
class _videoscreenState extends State<videoscreen> {
  late VideoPlayerController _controller;

  late VideoPlayerController _controller2;
  late VideoPlayerController _controller1;

  @override
  void initState() {
    super.initState();
    _controller1 = VideoPlayerController.asset('assets/videos/manualcar.mp4')
      ..initialize().then((_) {
        setState(() {
          // _controller1.value.isPlaying
          //     ? _controller1.pause()
          //     : _controller1.play();
        });
      });
    _controller2 =
        VideoPlayerController.asset('assets/videos/cockpitdrills.mp4')
          ..initialize().then((_) {
            setState(() {
              // _controller2.value.isPlaying
              //     ? _controller2.pause()
              //     : _controller2.play();
            });
          });
    _controller = VideoPlayerController.asset('assets/videos/carcontrols.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          // ignore: unnecessary_statements
          _;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Basic Driving Tutorials'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(),
                  child: GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        _controller.pause();
                      });
                    },
                    onTap: () {
                      setState(() {
                        _controller.play();
                      });
                    },
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(
                        _controller,
                      ),
                    ),
                  )),
              Container(
                decoration: BoxDecoration(color: Colors.black),
                alignment: Alignment.topLeft,
                child: Card(
                  color: Colors.black,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Basic Car Controls',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //SizedBox(
              //height: 20,
              //),
              Container(
                  decoration: BoxDecoration(),
                  child: GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        _controller1.pause();
                      });
                    },
                    onTap: () {
                      setState(() {
                        _controller1.play();
                      });
                    },
                    child: AspectRatio(
                      aspectRatio: _controller1.value.aspectRatio,
                      child: VideoPlayer(
                        _controller1,
                      ),
                    ),
                  )),
              Container(
                decoration: BoxDecoration(color: Colors.black),
                alignment: Alignment.topLeft,
                child: Card(
                  color: Colors.black,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Manual Car Tutorial',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //

              Container(
                child: GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      _controller2.pause();
                    });
                  },
                  onTap: () {
                    setState(() {
                      _controller2.play();
                    });
                  },
                  child: AspectRatio(
                    aspectRatio: _controller2.value.aspectRatio,
                    child: VideoPlayer(
                      _controller2,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black),
                alignment: Alignment.topLeft,
                child: Card(
                  color: Colors.black,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'The Cockpit Drill',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class _ButterFlyAssetVideo extends StatefulWidget {
  @override
  _ButterFlyAssetVideoState createState() => _ButterFlyAssetVideoState();
}

class _ButterFlyAssetVideoState extends State<_ButterFlyAssetVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/Butterfly-209.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          const Text('With assets mp4'),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  _ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _ControlsOverlay({required VideoPlayerController controller}) {}
}
