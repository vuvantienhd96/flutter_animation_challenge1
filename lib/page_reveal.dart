import 'package:flutter/material.dart';
import 'dart:math';

class PageReveal extends StatelessWidget {
  final double revealPersent;
  final Widget child;

  PageReveal({this.revealPersent, this.child});

  @override
  Widget build(BuildContext context) {
    return new ClipOval(
      clipper: new CircleRevealClipper(revealPersent),
      child: child,
    );
  }
}

class CircleRevealClipper extends CustomClipper<Rect> {
  final double revealPercent;

  CircleRevealClipper(this.revealPercent);

  @override
  Rect getClip(Size size) {
    final epicenter = new Offset(size.width / 2, size.height * 0.9);

    // caculator distance from epicenter to the top left corner to make sure we fill the screen
    double theta = atan(epicenter.dy / epicenter.dx);
    final distanceToConer = epicenter.dy / sin(theta);

    final radius = distanceToConer * revealPercent;
    final diameter = 2 * radius;

    return new Rect.fromLTWH(
        epicenter.dx - radius, epicenter.dy - radius, diameter, diameter);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}