import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../styleguide.dart';

class Background extends StatefulWidget {
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1500,
      ),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    )..addListener(() {
        setState(() {});
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
          child: Transform.rotate(
            angle: math.pi / 2 * _animationController.value,
            child: Transform.translate(
              offset: Offset(
                  -MediaQuery.of(context).size.height * (.9225 - .09 / 2) / 2 -
                      MediaQuery.of(context).size.height /
                          4 *
                          _animationController.value,
                  -MediaQuery.of(context).size.height *
                      .9225 /
                      20 *
                      _animationController.value),
              child: Transform.scale(
                alignment: Alignment.topLeft,
                scale: 2 + 1.4 * _animationController.value,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.height * .9225 / 2 * 3 / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topLeft,
                      repeat: ImageRepeat.repeatX,
                      image:
                          AssetImage('assets/images/app_background_single.png'),
                    ),
                  ),
                  child: null,
                ),
              ),
            ),
          ),
        ),
        _animationController.value==0? Center(
          child: InkWell(
            onTap: () {
              _animationController.forward();
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: almostWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: almostWhiteColor,
                    blurRadius: 1,
                    spreadRadius: 1,
                  )
                ],
              ),
            ),
          ),
        ):Center(),
      ],
    );
  }
}
