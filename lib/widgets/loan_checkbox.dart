import 'package:flutter/material.dart';

import '../styleguide.dart';

class LoanCheckbox extends StatefulWidget {
  final double positionTop;
  List<String> texts;
  final Function updateInterestRateFunction;
  final double interestRate;

  LoanCheckbox(
    this.positionTop,
    this.texts,
    this.updateInterestRateFunction,
    this.interestRate,
  );

  @override
  _LoanCheckboxState createState() => _LoanCheckboxState();
}

class _LoanCheckboxState extends State<LoanCheckbox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.positionTop,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData(
                unselectedWidgetColor: grayColor,
              ),
              child: Container(
                child: Checkbox(
                  activeColor: redColor,
                  onChanged: (bool value) {
                    setState(() {
                      isSelected = !isSelected;
                      widget.updateInterestRateFunction(isSelected ? widget.interestRate : 0.0);
                    });
                  },
                  value: isSelected,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: widget.texts[0],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: widget.texts[1],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: widget.texts[2],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
