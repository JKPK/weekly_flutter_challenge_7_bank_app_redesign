import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../widgets/menu_background.dart';
import '../widgets/menu_girl.dart';
import '../widgets/menu_logo.dart';

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
        MenuGirl(_logoAnimationController.value == 1),
        MenuBackground(backgroundTopMargin),
        MenuLogo(logoPosition),
      ],
    );
  }
}
