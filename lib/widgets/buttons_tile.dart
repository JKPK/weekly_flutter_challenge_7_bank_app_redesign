import 'package:flutter/material.dart';

import '../styleguide.dart';

class ButtonsTile extends StatelessWidget {
  final double positionTop;
  final Function onTapFunction;
  final int variant;
  final double opacity;

  ButtonsTile({
    this.positionTop,
    this.onTapFunction,
    this.variant,
    this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: positionTop,
      child: (opacity > 0)
          ? Opacity(
              opacity: opacity,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: <Widget>[
                    if (variant == 0)
                      Button(
                        text: "Login",
                        color: seriouslyBlueColor,
                        callbackFunction: onTapFunction,
                      ),
                    if (variant == 0)
                      Button(
                        text: "Order a card",
                        color: redColor,
                        callbackFunction: onTapFunction,
                      ),
                    if (variant == 1)
                      Button(
                          text: "NEXT",
                          color: seriouslyBlueColor,
                          callbackFunction: onTapFunction,
                          fullsize: true),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }
}

class Button extends StatelessWidget {
  final Color color;
  final String text;
  final Function callbackFunction;
  final bool fullsize;
  Button({this.text, this.callbackFunction, this.color, this.fullsize = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / (fullsize ? 1 : 2) -
          15 * (fullsize ? 2 : 1),
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        textColor: almostWhiteColor,
        onPressed: callbackFunction,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
