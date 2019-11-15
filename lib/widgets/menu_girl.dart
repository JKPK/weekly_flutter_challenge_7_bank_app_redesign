import 'package:flutter/material.dart';

class MenuGirl extends StatelessWidget {
  final bool showGirl;

  MenuGirl(this.showGirl);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          child: AnimatedOpacity(
            opacity: showGirl ? 1 : 0,
            duration: Duration(milliseconds: 750),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .05,
              ),
              alignment: Alignment.topCenter,
              child: Image(
                width: MediaQuery.of(context).size.width * .9,
                image: AssetImage('assets/images/girl_shadow.png'),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: AnimatedOpacity(
            opacity: showGirl ? 1 : 0,
            duration: Duration(milliseconds: 750),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .05,
              ),
              alignment: Alignment.topCenter,
              child: Image(
                width: MediaQuery.of(context).size.width * .9,
                image: AssetImage('assets/images/girl.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
