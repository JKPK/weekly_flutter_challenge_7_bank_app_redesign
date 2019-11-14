import 'package:flutter/material.dart';

import '../widgets/background.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(),
        // Positioned(
        //   top: 0,
        //   left: 0,
        //   child: Opacity(
        //     opacity: .3,
        //     child: Container(
        //       padding: EdgeInsets.only(
        //         top: 20 + 5.0,
        //         left: MediaQuery.of(context).size.width * .05 + 7.0,
        //       ),
        //       alignment: Alignment.topCenter,
        //       child: Image(
        //         width: MediaQuery.of(context).size.width * .9,
        //         image: AssetImage('assets/images/girl_shadow.png'),
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: 0,
        //   left: 0,
        //   child: Container(
        //     padding: EdgeInsets.only(
        //       top: 20,
        //       left: MediaQuery.of(context).size.width * .05,
        //     ),
        //     alignment: Alignment.topCenter,
        //     child: Image(
        //       width: MediaQuery.of(context).size.width * .9,
        //       image: AssetImage('assets/images/girl.png'),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
