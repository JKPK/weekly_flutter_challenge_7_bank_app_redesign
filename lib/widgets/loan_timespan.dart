import 'package:flutter/material.dart';

import '../styleguide.dart';

class LoanTimespan extends StatefulWidget {
  final double positionTop;
  final Function updateTimespanInterestRateFunction;
  final double opacity;

  LoanTimespan(
    this.positionTop,
    this.updateTimespanInterestRateFunction,
    this.opacity,
  );

  @override
  _LoanTimespanState createState() => _LoanTimespanState();
}

class _LoanTimespanState extends State<LoanTimespan> {
  double rating = 0;
  List<int> ratings = [3, 6, 12, 36];
  List<double> monthsInterestsRates = [1, 0.75, 0.5, 0.25];
  int months = 3;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.positionTop,
      left: 20,
      right: 20,
      child: (widget.opacity>0) ?Opacity(
        opacity: widget.opacity,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$months months",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  valueIndicatorTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Slider(
                    activeColor: redColor,
                    value: rating,
                    min: 0,
                    max: 3,
                    onChanged: (selected) {
                      setState(() {
                        rating = selected;
                        months = ratings[rating.toInt()];
                      });
                      widget.updateTimespanInterestRateFunction(
                          monthsInterestsRates[rating.toInt()] * months);
                    },
                    divisions: 3,
                    label: "$months months"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("+ 1.0%"),
                    Text("+ 0.75%"),
                    Text("+ 0.5%"),
                    Text("+ 0.25%"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ):Container(),
    );
  }
}
