import 'package:flutter/material.dart';

import '../styleguide.dart';

class MenuLogo extends StatelessWidget {
  final Offset logoPosition;

  MenuLogo(this.logoPosition);

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
