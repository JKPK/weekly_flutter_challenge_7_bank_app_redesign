import 'package:flutter/material.dart';

import '../styleguide.dart';

class MenuTile extends StatelessWidget {
  final double positionTop;
  final AssetImage image;
  final String title;
  final String subtitle;
  final double opacity;

  MenuTile({
    this.positionTop,
    this.image,
    this.title,
    this.subtitle,
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
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: grayColor,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        minRadius: 30,
                        maxRadius: 30,
                        backgroundColor: grayColor,
                        child: Center(
                          child: Image(
                            height: 35,
                            image: image,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 15,
                                bottom: 5,
                              ),
                              child: Text(
                                title,
                                style: TextStyle(
                                  color: seriouslyBlueColor,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                subtitle,
                                style: TextStyle(
                                  color: seriouslyBlueColor,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Icon(
                            Icons.chevron_right,
                            size: 40,
                            color: seriouslyBlueColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}
