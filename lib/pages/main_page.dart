import 'package:flutter/material.dart';

import '../widgets/background.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            alignment: Alignment.topCenter,
            child: Image(
              width: MediaQuery.of(context).size.width,
              image: AssetImage('assets/images/girl_shadow.png'),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            alignment: Alignment.topCenter,
            child: Image(
              width: MediaQuery.of(context).size.width,
              image: AssetImage('assets/images/girl.png'),
            ),
          ),
        ),
        Positioned(
          child: ClipPath(
            clipper: CircleCutClipper(),
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
  @override
  Path getClip(Size size) {
    return Path();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
