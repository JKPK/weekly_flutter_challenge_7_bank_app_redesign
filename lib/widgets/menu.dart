import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../styleguide.dart';

import '../widgets/menu_background.dart';
import '../widgets/menu_girl.dart';
import '../widgets/menu_logo.dart';
import '../widgets/menu_tile.dart';
import '../widgets/buttons_tile.dart';
import '../widgets/loan_header.dart';
import '../widgets/loan_logo.dart';
import '../widgets/loan_amount.dart';
import '../widgets/loan_timespan.dart';
import '../widgets/loan_checkbox.dart';

class Menu extends StatefulWidget {
  final StreamController<double> splashAnimationStreamController;

  Menu(this.splashAnimationStreamController);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  bool isInit = false;
  double backgroundTopMargin;
  Offset bigCircleCentre;
  double bigCircleRadius;
  double logoCircleAngle;
  Offset logoPosition;
  double splashAnimation = 0;
  double loanAnimation = 0;
  bool showLogo = false;

  double loanBase = 20000;
  double loanReturn = 0;
  double loanBaseInterestRate = 12.5;
  double loanInterestRate = 15.5;
  double timespanInterestRate = 3;
  double pretermInterestRate = 0;
  double payoutInterestRate = 0;

  AnimationController _logoAnimationController;
  Animation<double> _logoAnimation;

  AnimationController _loanAnimationController;
  Animation<double> _loanAnimation;
  Offset loanLogoPosition;

  void calculateLoanReturn() {
    setState(() {
      loanInterestRate = loanBaseInterestRate +
          timespanInterestRate +
          pretermInterestRate +
          payoutInterestRate;
      loanReturn = loanBase * (100 + loanInterestRate) / 100;
    });
  }

  void updateTimespanInterestRate(value) {
    timespanInterestRate = value;
    calculateLoanReturn();
  }

  void updatePretermInterestRate(value) {
    pretermInterestRate = value;
    calculateLoanReturn();
  }

  void updatePayoutInterestRate(value) {
    payoutInterestRate = value;
    calculateLoanReturn();
  }

  @override
  void didChangeDependencies() {
    if (!isInit) {
      isInit = true;
      updateAnimatedSlideIn();
      updateLogoPosition();
    }
    super.didChangeDependencies();
  }

  void updateAnimatedSlideIn() {
    backgroundTopMargin = MediaQuery.of(context).size.height * 1.05 -
        MediaQuery.of(context).size.height * .657 * splashAnimation;
    bigCircleCentre = Offset(MediaQuery.of(context).size.width * 0.5,
        -MediaQuery.of(context).size.width * 1.2 - 330 + backgroundTopMargin);
    bigCircleRadius = MediaQuery.of(context).size.width * 2;
  }

  void updateLogoPosition() {
    setState(() {
      logoCircleAngle = math.pi * .4 +
          math.pi * .1 * _logoAnimationController.value +
          math.pi * .1 * _loanAnimationController.value;

      logoPosition = Offset(
          bigCircleCentre.dx -
              30 +
              bigCircleRadius * math.cos(logoCircleAngle) -
              _loanAnimationController.value *
                  MediaQuery.of(context).size.width,
          bigCircleCentre.dy -
              40 +
              bigCircleRadius * math.sin(logoCircleAngle) -
              160 * _loanAnimationController.value);

      loanLogoPosition = Offset(
        MediaQuery.of(context).size.width / 2,
        backgroundTopMargin - _loanAnimationController.value * 140,
      );
    });
  }

  @override
  void initState() {
    calculateLoanReturn();

    widget.splashAnimationStreamController.stream
      ..listen((data) {
        setState(() {
          splashAnimation = data;
          updateAnimatedSlideIn();
          if (!showLogo && data > .9) {
            showLogo = true;
            _logoAnimationController.forward();
          }
        });
      });

    _logoAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );

    _logoAnimation = CurvedAnimation(
      parent: _logoAnimationController,
      curve: Curves.easeIn,
    )..addListener(() {
        updateLogoPosition();
      });

    _loanAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1500,
      ),
    );

    _loanAnimation = CurvedAnimation(
      parent: _loanAnimationController,
      curve: Curves.easeIn,
    )..addListener(() {
        loanAnimation = _loanAnimationController.value;
        updateLogoPosition();
      });

    super.initState();
  }

  void showLoan() {
    _loanAnimationController.forward();
  }

  void hideLoan() {
    _loanAnimationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    updateAnimatedSlideIn();
    return Stack(
      children: <Widget>[
        MenuGirl(_logoAnimationController.value == 1),
        Positioned(
          child: IgnorePointer(
            child: Opacity(
              opacity: _loanAnimationController.value,
              child: Container(
                color: redColor,
              ),
            ),
          ),
        ),
        MenuBackground(
          backgroundTopMargin - _loanAnimationController.value * 130,
        ),
        if (_loanAnimationController.value < 1) MenuLogo(logoPosition),
        MenuTile(
          title: "Use Conveniently",
          subtitle: "Simplify access to desired operations.",
          positionTop: backgroundTopMargin +
              50 +
              (1 - splashAnimation) * 200 +
              _loanAnimationController.value * 200,
          image: AssetImage('assets/icons/power.png'),
          opacity: _loanAnimationController.value < .5
              ? ((1 - _loanAnimationController.value * 2))
              : 0,
        ),
        MenuTile(
          title: "Control spending",
          subtitle:
              "We analyze your expenses and give advice on their optimization.",
          positionTop: backgroundTopMargin +
              150 +
              (1 - splashAnimation) * 400 +
              _loanAnimationController.value * 400,
          image: AssetImage('assets/icons/math.png'),
          opacity: _loanAnimationController.value < .5
              ? ((1 - _loanAnimationController.value * 2))
              : 0,
        ),
        MenuTile(
          title: "Save and earn",
          subtitle:
              "Get an advice on how to get the cashback, interest and miles.",
          positionTop: backgroundTopMargin +
              250 +
              (1 - splashAnimation) * 600 +
              _loanAnimationController.value * 600,
          image: AssetImage('assets/icons/piggy.png'),
          opacity: _loanAnimationController.value < .5
              ? ((1 - _loanAnimationController.value * 2))
              : 0,
        ),
        ButtonsTile(
          positionTop:
              backgroundTopMargin + 410 + _loanAnimationController.value * 800,
          onTapFunction: showLoan,
          variant: 0,
          opacity: _loanAnimationController.value < .5
              ? ((1 - _loanAnimationController.value * 2))
              : 0,
        ),
        if (_loanAnimationController.value == 1)
          LoanHeader(
            loanInterestRate,
            hideLoan,
          ),
        LoanLogo(
          loanLogoPosition,
          loanReturn,
        ),
        LoanAmount(
          loanLogoPosition.dy + 70 + (1 - _loanAnimationController.value) * 50,
          _loanAnimationController.value > .5
              ? ((_loanAnimationController.value - .5) * 2)
              : 0.0,
        ),
        LoanTimespan(
          loanLogoPosition.dy +
              180 +
              (1 - _loanAnimationController.value) * 200,
          updateTimespanInterestRate,
          _loanAnimationController.value > .5
              ? ((_loanAnimationController.value - .5) * 2)
              : 0.0,
        ),
        LoanCheckbox(
          loanLogoPosition.dy +
              320 +
              (1 - _loanAnimationController.value) * 400,
          [
            "Without pre-term closing (",
            "+0.5",
            "%)",
          ],
          updatePretermInterestRate,
          0.5,
          _loanAnimationController.value > .5
              ? ((_loanAnimationController.value - .5) * 2)
              : 0.0,
        ),
        LoanCheckbox(
          loanLogoPosition.dy +
              370 +
              (1 - _loanAnimationController.value) * 800,
          [
            "Without monthly payout (",
            "+0.25",
            "%)",
          ],
          updatePayoutInterestRate,
          0.25,
          _loanAnimationController.value > .5
              ? ((_loanAnimationController.value - .5) * 2)
              : 0.0,
        ),
        ButtonsTile(
          positionTop: backgroundTopMargin +
              410 +
              (1 - _loanAnimationController.value) * 800,
          onTapFunction: hideLoan,
          variant: 1,
          opacity: _loanAnimationController.value,
        ),
      ],
    );
  }
}
