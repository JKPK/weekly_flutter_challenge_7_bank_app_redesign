import 'package:flutter/material.dart';

import '../styleguide.dart';

class LoanHeader extends StatelessWidget {
  final double loanInterestRate;
  final Function onTapFunction;

  LoanHeader(
    this.loanInterestRate,
    this.onTapFunction,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 55,
          left: 20,
          child: IconButton(
            onPressed: onTapFunction,
            icon: Icon(
              Icons.arrow_back_ios,
              color: almostWhiteColor,
              size: 20,
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 0,
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    "Interest rate",
                    style: TextStyle(
                      color: almostWhiteColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "${loanInterestRate}%",
                    style: TextStyle(
                      color: almostWhiteColor,
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
