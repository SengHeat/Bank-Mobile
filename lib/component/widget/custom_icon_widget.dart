
import 'package:flutter/material.dart';

Widget customIconImage({
  required String imageName,
  double radios = 16,
  BoxFit boxFit = BoxFit.cover,
  Color? color,
}) {
  return Builder(
    builder: (context) {
      color ??= Theme.of(context).iconTheme.color ?? Colors.black;
      return Image.asset(
        imageName,
        width: radios,
        height: radios,
        fit: boxFit,
        color: color,
      );
    },
  );
}