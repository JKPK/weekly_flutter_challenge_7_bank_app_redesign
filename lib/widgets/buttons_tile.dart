import 'package:flutter/material.dart';

import '../styleguide.dart';

class ButtonsTile extends StatelessWidget {
  final double positionTop;
  final Function onTapFunction;

  ButtonsTile({this.positionTop, this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: positionTop,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            Button(
              text: "Login",
              color: seriouslyBlueColor,
              callbackFunction: onTapFunction,
            ),
            Button(
              text: "Order a card",
              color: redColor,
              callbackFunction: onTapFunction,
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final Color color;
  final String text;
  final Function callbackFunction;

  Button({this.text, this.callbackFunction, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2-15,
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
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
