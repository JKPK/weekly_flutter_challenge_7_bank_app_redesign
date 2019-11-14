import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

import '../styleguide.dart';

class Background extends StatefulWidget {
  final Function callbackFunction;

  Background(this.callbackFunction);

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
        setState(() {
          widget.callbackFunction(_animationController.value);
        });
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
        _animationController.value == 0
            ? Center(
                child: InkWell(
                  onTap: () {
                    _animationController.forward();
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: MediaQuery.of(context).size.width * .25,
                    height: MediaQuery.of(context).size.width * .25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          MediaQuery.of(context).size.width * .125,
                        ),
                      ),
                      color: almostWhiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: almostWhiteColor,
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                        )
                      ],
                    ),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: redColor,
                              width: 7.0,
                            ),
                          ),
                        ),
                        child: Text(
                          "JK",
                          style: TextStyle(
                            height: 1,
                            color: redColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Center(),
      ],
    );
  }
}
