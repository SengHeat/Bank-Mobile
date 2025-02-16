import 'package:flutter/material.dart';

Widget customLoadingSpinner({
  Color color = Colors.blue,
  double size = 50.0,
  bool isDeterminate = false,
  double progress = 0.5, // Used only if isDeterminate is true
}) {
  return isDeterminate
      ? CircularProgressIndicator(
    value: progress,
    valueColor: AlwaysStoppedAnimation(color),
    strokeWidth: 6.0,
  )
      : CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(color),
    strokeWidth: 6.0,
  );
}