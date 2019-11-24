import 'package:flutter/material.dart';

import '../styleguide.dart';

class LoanLogo extends StatelessWidget {
  final Offset logoPosition;
  final int width = 200;
  final int height = 50;

  LoanLogo(this.logoPosition);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: logoPosition.dy - height / 2,
      left: logoPosition.dx - width / 2,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: orangeColor,
          gradient: LinearGradient(
            colors: [
              orangeColor,
              darkOrangeColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.all(
            const Radius.circular(10),
          ),
        ),
        child: Center(
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "€22 000",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: " in the end",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
