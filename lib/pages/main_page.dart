import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/background.dart';
import '../widgets/menu.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  StreamController<double> _splashAnimationStreamController =
      new StreamController();

  @override
  void dispose() {
    _splashAnimationStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(_splashAnimationStreamController),
        Menu(_splashAnimationStreamController),
      ],
    );
  }
}
