import 'package:flutter/material.dart';

var smallGradient = new LinearGradient(
    colors: [const Color(0xFFFFFFFF), const Color(0xFF000000)],
    tileMode: TileMode.clamp,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0]);

var biggerGradinet = new LinearGradient(
    colors: [const Color(0xFFFFFFFF), const Color(0xFF000000)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);

class GradientCircles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -95.0,
          left: 110,
          right: -195.0,
          child: Opacity(
            opacity: 0.1,
            child: new Container(
              height: 900.0,
              decoration: BoxDecoration(
                  gradient: smallGradient, shape: BoxShape.circle),
            ),
          ),
        ),
        Positioned(
          top: -65.0,
          right: -15.0,
          child: Opacity(
            opacity: 0.5,
            child: new Container(
              height: 120.0,
              width: 140.0,
              decoration: BoxDecoration(
                  gradient: biggerGradinet, shape: BoxShape.circle),
            ),
          ),
        ),
      ],
    );
  }
}
