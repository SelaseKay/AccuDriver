import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:video_player/video_player.dart';
//import 'package:flutter/material.dart';

//void main() => runApp(videoscreen());

class videoscreen extends StatefulWidget {
  @override
  _videoscreenState createState() => _videoscreenState();
}

class _videoscreenState extends State<videoscreen> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller1;

  @override
  void initState() {
    super.initState();
    _controller1 = VideoPlayerController.asset('video/manualcar.mp4')
      ..initialize().then((_) {
        setState(() {
          // _controller1.value.isPlaying
          //     ? _controller1.pause()
          //     : _controller1.play();
        });
      });
    _controller2 = VideoPlayerController.asset('video/cockpitdrills.mp4')
      ..initialize().then((_) {
        setState(() {
          // _controller2.value.isPlaying
          //     ? _controller2.pause()
          //     : _controller2.play();
        });
      });
    _controller = VideoPlayerController.asset('video/carcontrols.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Video Tutorials'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  decoration:
                      BoxDecoration(),
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
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration:
                      BoxDecoration(),
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
              SizedBox(
                height: 20,
              ),
             Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
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
                  )),
            ],
          ),
        ),
        /*  floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),*/
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
