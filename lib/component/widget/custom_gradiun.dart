import 'package:flutter/material.dart';

Widget customGradientContainer({
  required Widget child,
  required List<Color> gradientColors,
  double borderRadius = 16.0,
  double padding = 16.0,
}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    padding: EdgeInsets.all(padding),
    child: child,
  );
}
