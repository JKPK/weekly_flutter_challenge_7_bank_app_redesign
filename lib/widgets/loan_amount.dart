import 'package:flutter/material.dart';

import '../styleguide.dart';

class LoanAmount extends StatelessWidget {
  final double positionTop;

  LoanAmount(this.positionTop);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: positionTop,
      left: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: grayColor,
            width: 2,
          ),
        ),
        child: Row(
          children: <Widget>[
            Text(
              "€ 20 000",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Spacer(),
            Container(
              width: 40,
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: grayColor,
              ),
              child: Image.asset(
                "assets/icons/gift.png",
                // width: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
