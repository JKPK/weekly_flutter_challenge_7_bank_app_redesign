import 'dart:async';
import 'dart:math' as math;

import '../styleguide.dart';

import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  StreamController<double> splashAnimationStreamController;

  Menu(this.splashAnimationStreamController);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  bool isInit = false;
  double backgroundTopMargin;
  Offset bibCircleCentre;
  double bigCircleRadius;
  double logoCircleAngle;
  Offset logoPosition;
  double splashAnimation = 0;
  bool showLogo = false;

  AnimationController _logoAnimationController;
  Animation<double> _logoAnimation;

  @override
  void didChangeDependencies() {
    if (!isInit) {
      isInit = true;
      updateAnimatedSlideIn();
      updateLogoPosition();
    }
    super.didChangeDependencies();
  }

  void updateAnimatedSlideIn() {
    backgroundTopMargin = MediaQuery.of(context).size.height * 1.05 -
        MediaQuery.of(context).size.height * .657 * splashAnimation;
    bibCircleCentre = Offset(MediaQuery.of(context).size.width * 0.5,
        -MediaQuery.of(context).size.width * 1.2 - 330 + backgroundTopMargin);
    bigCircleRadius = MediaQuery.of(context).size.width * 2;
  }

  void updateLogoPosition() {
    setState(() {
      logoCircleAngle =
          math.pi * .4 + math.pi * .1 * _logoAnimationController.value;
      logoPosition = Offset(
          bibCircleCentre.dx - 30 + bigCircleRadius * math.cos(logoCircleAngle),
          bibCircleCentre.dy -
              30 +
              bigCircleRadius * math.sin(logoCircleAngle));
    });
  }

  @override
  void initState() {
    widget.splashAnimationStreamController.stream
      ..listen((data) {
        setState(() {
          splashAnimation = data;
          updateAnimatedSlideIn();
          if (!showLogo && data > .9) {
            showLogo = true;
            _logoAnimationController.forward();
          }
        });
      });

    _logoAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );

    _logoAnimation = CurvedAnimation(
      parent: _logoAnimationController,
      curve: Curves.easeIn,
    )..addListener(() {
        updateLogoPosition();
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
            clipper: CircleCutClipper(backgroundTopMargin),
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: logoPosition.dy,
          left: logoPosition.dx,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: redColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: almostWhiteColor,
                      width: 4.0,
                    ),
                  ),
                ),
                child: Text(
                  "JK",
                  style: TextStyle(
                    height: 1,
                    color: almostWhiteColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
