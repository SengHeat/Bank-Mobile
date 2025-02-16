

import 'package:flutter/material.dart';

Widget customCard({
  required Widget child,
  double elevation = 4.0,
  Color shadowColor = Colors.black26,
  double borderRadius = 12.0,
  double padding = 16.0,
}) {
  return Card(
    elevation: elevation,
    shadowColor: shadowColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: Padding(
      padding: EdgeInsets.all(padding),
      child: child,
    ),
  );
}