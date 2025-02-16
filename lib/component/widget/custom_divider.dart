import 'package:flutter/material.dart';

Widget customDivider({
  double thickness = 2.0,
  double indent = 0.0,
  double endIndent = 0.0,
  Color color = Colors.grey,
}) {
  return Divider(
    thickness: thickness,
    indent: indent,
    endIndent: endIndent,
    color: color,
  );
}
