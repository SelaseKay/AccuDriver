import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final String heroNumber;
  final String imageAsset;

  const VideoPlayerScreen(
      {Key? key,
      required this.videoPlayerController,
      this.looping = false,
      required this.heroNumber,
      required this.imageAsset})
      : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        looping: widget.looping,
        errorBuilder: (context, errorMessage) {
          return Center(
              child: Text("Video unable to open",
                  style: TextStyle(color: Colors.white)));
        },
        placeholder: Hero(
            tag: "video${widget.heroNumber}",
            child: Image.asset(widget.imageAsset)));
  }

  // void _initializeChewi(){

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
