import 'package:flutter/material.dart';

Future<void> showCustomDialog({
  required BuildContext context,
  required String title,
  required String content,
  String positiveButtonText = 'OK',
  String negativeButtonText = 'Cancel',
  VoidCallback? onPositivePressed,
  VoidCallback? onNegativePressed,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: onNegativePressed ?? () => Navigator.of(context).pop(),
            child: Text(negativeButtonText),
          ),
          TextButton(
            onPressed: onPositivePressed ?? () => Navigator.of(context).pop(),
            child: Text(positiveButtonText),
          ),
        ],
      );
    },
  );
}
