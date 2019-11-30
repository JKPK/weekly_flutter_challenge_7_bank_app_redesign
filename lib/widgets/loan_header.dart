import 'package:flutter/material.dart';

import '../styleguide.dart';

class LoanHeader extends StatefulWidget {
  final double loanInterestRate;
  final Function onTapFunction;
  final bool isVisible;

  LoanHeader(
    this.loanInterestRate,
    this.onTapFunction,
    this.isVisible,
  );

  @override
  _LoanHeaderState createState() => _LoanHeaderState();
}

class _LoanHeaderState extends State<LoanHeader> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: widget.isVisible ? 1 : 0,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 55,
            left: 20,
            child: IconButton(
              onPressed: widget.onTapFunction,
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
                      "${widget.loanInterestRate}%",
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
      ),
    );
  }
}
