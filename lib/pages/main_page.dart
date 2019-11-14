import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../widgets/background.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double splashAnimation = 0;

  void updateSplashAnimation(double animationValue) {
    setState(() {
      splashAnimation = animationValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(updateSplashAnimation),
        Positioned(
          top: 0,
          left: 0,
          child: AnimatedOpacity(
            opacity: splashAnimation < 1 ? 0 : 1,
            duration: Duration(milliseconds: 1000),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .05,
              ),
              alignment: Alignment.topCenter,
              child: Image(
                width: MediaQuery.of(context).size.width * .9,
                image: AssetImage('assets/images/girl_shadow.png'),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: AnimatedOpacity(
            opacity: splashAnimation < 1 ? 0 : 1,
            duration: Duration(milliseconds: 1000),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .05,
              ),
              alignment: Alignment.topCenter,
              child: Image(
                width: MediaQuery.of(context).size.width * .9,
                image: AssetImage('assets/images/girl.png'),
              ),
            ),
          ),
        ),
        Positioned(
          child: ClipPath(
            clipper: CircleCutClipper(MediaQuery.of(context).size.height *
                    1.05 -
                MediaQuery.of(context).size.height * .657 * splashAnimation),
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class CircleCutClipper extends CustomClipper<Path> {
  double fromTop;
  CircleCutClipper(this.fromTop);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.addArc(
      Rect.fromLTWH(
        -size.width * 1.5,
        -size.width * 3.2 - 330 + fromTop,
        size.width * 4,
        size.width * 4,
      ),
      0,
      180 * (math.pi / 180.0),
    );
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CircleCutClipper oldClipper) {
    return oldClipper.fromTop != fromTop;
  }
}
