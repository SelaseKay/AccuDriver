import 'package:accudriver/assets/Strings.dart';
import 'package:accudriver/custom_widget/videothumbnail.dart';
import 'package:accudriver/screens/videoplayerscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:video_player/video_player.dart';
//import 'package:flutter/material.dart';

void main() => runApp(videoscreen());

class videoscreen extends StatefulWidget {
  @override
  _videoscreenState createState() => _videoscreenState();
}

class _videoscreenState extends State<videoscreen> {

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    final double screenHeight =
        MediaQuery.of(context).size.height - (statusBarHeight + kToolbarHeight);

    final double videoThumnailHeight = screenHeight * 0.35;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              elevation: 10.0,
              forceElevated: true,
              title: Text(Strings.basicDrivingTuts,
                  style: TextStyle(color: Colors.black)),
              backgroundColor: HexColor("#F3F3F3"),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                GestureDetector(
                  onTap: () {
                    _navigateToVideoScreen("assets/videos/carcontrols.mp4",
                        "1",
                        "assets/images/carcontrols.png"
                        );
                  },
                  child: VideoThumnail(
                      height: videoThumnailHeight,
                      marginTop: 24.0,
                      heroNumber: "1",
                      imageName: "carcontrols.png",
                      imageDescription: "Learn how to control your car."),
                ),
                GestureDetector(
                  onTap: () {
                    _navigateToVideoScreen("assets/videos/cockpitdrills.mp4",
                        "2",
                        "assets/images/cockpitdrills.png"
                        );
                  },
                  child: VideoThumnail(
                      height: videoThumnailHeight,
                      marginTop: 16.0,
                      heroNumber: "2",
                      imageName: "cockpitdrills.png",
                      imageDescription: "Cockpitdrills people."),
                ),
                GestureDetector(
                  onTap: () {
                    _navigateToVideoScreen("assets/videos/manualcar.mp4",
                        "3",
                        "assets/images/manualcar.png"
                        );
                  },
                  child: VideoThumnail(
                      height: videoThumnailHeight,
                      marginTop: 16.0,
                      marginBottom: 8.0,
                      heroNumber: "3",
                      imageName: "manualcar.png",
                      imageDescription: "Manual stuff............"),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToVideoScreen(String videoUrl, String heroNumber, String imageAsset) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
                imageAsset: imageAsset,
                  heroNumber: heroNumber,
                  videoPlayerController:
                      VideoPlayerController.asset(videoUrl),
                )));
  }
}
