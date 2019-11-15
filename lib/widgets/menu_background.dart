import 'dart:math' as math;

import 'package:flutter/material.dart';

class MenuBackground extends StatelessWidget {
  final double backgroundTopMargin;

  MenuBackground(this.backgroundTopMargin);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: ClipPath(
        clipper: CircleCutClipper(backgroundTopMargin),
        child: Container(
          color: Colors.white,
        ),
      ),
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
