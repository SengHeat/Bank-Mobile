import 'package:flutter/material.dart';

Widget customAvatar({
  required String imageUrl,
  String? initials,
  double radius = 30.0,
  double borderWidth = 2.0,
  Color borderColor = Colors.white,
}) {
  return CircleAvatar(
    radius: radius,
    backgroundColor: Colors.grey.shade200,
    backgroundImage: imageUrl.isNotEmpty
        ? NetworkImage(imageUrl)
        : null,
    child: imageUrl.isEmpty
        ? Text(
      initials ?? '',
      style: TextStyle(color: Colors.black, fontSize: radius / 2),
    )
        : null,
    foregroundColor: Colors.black,
  );
}
