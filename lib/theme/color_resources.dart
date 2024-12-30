// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ColorResources {
  //TODO Method to get Primary Color dynamically based on theme mode
  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).brightness != Brightness.dark
        ? Color(0xFF1B3351)
        : Color(0xFF1B3351);
  }

  static Color getPrimaryColor1(BuildContext context) {
    return Theme.of(context).brightness != Brightness.dark
        ? Color(0xED205887)
        : Color(0xED205887);
  }

  static Color getGoldColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Color(0xffc29a39)  // Darker blue for dark mode
        : Color(0xffc29a39) ;  // Lighter blue for light mode
  }


  //TODO Method to get Secondary Color dynamically based on theme mode
  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Color(0xFF121212)
        : Color(0xFFF5F5F5);
  }

  //TODO Accent Colors (Same for both modes)
  static Color accentGreen = Color(0xff0FBF61);
  static Color accentRed = Color(0xffFF5A5F);

  //TODO Method to get Neutral Colors dynamically based on theme mode
  static Color getWhiteColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Color(0xff1A1A1A)
        : Color(0xffffffff);
  }

  static Color getBlackColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Color(0xffE0E0E0)
        : Color(0xff212121);
  }

  static Color getDarkGrey(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Color(0xffA3A3A3)
        : Color(0xff757575);
  }

  static Color getMediumGrey(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Color(0xffBDBDBD)
        : Color(0xff9E9E9E);
  }

  static Color getLightGrey(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Color(0xff3A3A3A)
        : Color(0xffE0E0E0);
  }

  //TODO Feedback Colors (Same for both modes)
  static Color successColor = Color(0xff28A745);
  static Color warningColor = Color(0xffFFC107);
  static Color errorColor = Color(0xffDC3545);

  //TODO Transparent Color
  static const Color transparentColor = Colors.transparent;

  //TODO Method to get Overlay Colors dynamically based on theme mode
  static Color getOverlayDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Color(0xff000000).withOpacity(0.7)
        : Color(0xff000000).withOpacity(0.5);
  }

  static Color getOverlayLight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Color(0xffffffff).withOpacity(0.9)
        : Color(0xffffffff).withOpacity(0.7);
  }
  static Color getAppBarTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Color(0xffffffff) // White text color for dark mode app bar
        : Color(0xffffffff); // Black text color for light mode app bar
  }

  static LinearGradient getGradientColor(BuildContext context) {
    return LinearGradient(
      colors: [
        getPrimaryColor(context),
        getPrimaryColor(context),
        getPrimaryColor(context),
        getPrimaryColor(context),
        getBackgroundColor(context),
        getBackgroundColor(context),
        getBackgroundColor(context),
        getBackgroundColor(context),
        getBackgroundColor(context),
        getBackgroundColor(context),
        getBackgroundColor(context),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

}