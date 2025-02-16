
import 'package:flutter/material.dart';

Widget customImageWidget({
  required String imageUrl,
  double width = double.infinity,
  double height = 200.0,
  BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12.0)),
  Color backgroundColor = Colors.transparent,
}) {
  return ClipRRect(
    borderRadius: borderRadius,
    child: Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
        return Container(
          width: width,
          height: height,
          color: backgroundColor,
          alignment: Alignment.center,
          child: Icon(
            Icons.error,
            color: Colors.red,
            size: 50.0,
          ),
        );
      },
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            // value: loadingProgress.expectedTotalBytes != null
            //     ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
            //     : null,
          ),
        );
      },
    ),
  );
}
