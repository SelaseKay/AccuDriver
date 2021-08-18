class RoadSign {
  final String signImage, signName;

  RoadSign({required this.signImage, required this.signName});
}

List signName = [
   'Roundabout Ahead',
    'No Entry',
    'Speed Limit 50km/h',
    'Men At Work',
    'Left Hand Curve',
    'Narrow Road From Right',
    'Narrow Road from Both Sides',
    'Pedestrian Crossing',
    'Do Not Enter',
    'No Cars Allowed',
    'No Right Turn',
    'Stop',
    'No U-turn',
    'Traffic Signal',
];

List signImage = [
   'assets/images/roundabout.jpg',
    'assets/images/noentry.jpg',
    'assets/images/speedlimit.jpg',
    'assets/images/menatwork.jpg',
    'assets/images/lefthandcurve.jpg',
    'assets/images/narrowroad.jpg',
    'assets/images/narrowroad2.jpg',
    'assets/images/pedestriancrossing.jpg',
    'assets/images/donotenter.jpg',
    'assets/images/nocarsallowed.jpg',
    'assets/images/norightturn.jpg',
    'assets/images/stop.jpg',
    'assets/images/nouturn.png',
    'assets/images/trafficsignal.png',
];

List<RoadSign> signs = [
  RoadSign(signImage: signImage[0], signName: signName[0]),
  RoadSign(signImage: signImage[1], signName: signName[1]),
  RoadSign(signImage: signImage[2], signName: signName[2]),
  RoadSign(signImage: signImage[3], signName: signName[3]),
  RoadSign(signImage: signImage[4], signName: signName[4]),
  RoadSign(signImage: signImage[5], signName: signName[5]),
  RoadSign(signImage: signImage[6], signName: signName[6]),
  RoadSign(signImage: signImage[7], signName: signName[7]),
  RoadSign(signImage: signImage[8], signName: signName[8]),
  RoadSign(signImage: signImage[9], signName: signName[9]),
  RoadSign(signImage: signImage[10], signName: signName[10]),
  RoadSign(signImage: signImage[11], signName: signName[11]),
  RoadSign(signImage: signImage[12], signName: signName[12]),
  RoadSign(signImage: signImage[13], signName: signName[13]),
];
