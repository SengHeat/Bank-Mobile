import 'package:bank_mobile_app/helper/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveFontSizeController extends GetxController {
  /// Reactive variable to hold the text scale factor
  var scaleText = 1.0.obs;

  /// Initialize the text scale factor based on device
  initialize(BuildContext context) {
    scaleText.value = MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.4);
  }

  /// Method to manually update the text scale factor
  updateTextScale(double newScale) {
    scaleText.value = newScale.clamp(0.8, 1.4);
    update();
  }

  /// Base font sizes according to the device type
  double getBaseFontSize(BuildContext context, double mobileSize, double tabletSize, double desktopSize) {
    if (Responsive.isMobilePhone()) {
      return mobileSize;
    } else if (Responsive.isTab()) {
      return tabletSize;
    } else if (Responsive.isDesktop()) {
      return desktopSize;
    }
    return mobileSize; // Default to mobile size if undetected
  }

  /// Tiny Text (e.g., product badge labels, minor captions)
  double fontSizeTiny(BuildContext context) => getBaseFontSize(context, 8, 10, 12) * scaleText.value;

  /// Extra Small Text (e.g., secondary buttons, captions, labels)
  double fontSizeExtraSmall(BuildContext context) => getBaseFontSize(context, 12, 14, 15) * scaleText.value;

  /// Small Text (e.g., product descriptions, smaller buttons)
  double fontSizeSmall(BuildContext context) => getBaseFontSize(context, 14, 16, 18) * scaleText.value;

  /// Medium Text (e.g., product titles, main button labels)
  double fontSizeMedium(BuildContext context) => getBaseFontSize(context, 16, 18, 20) * scaleText.value;

  /// Default Text (e.g., general body text, user reviews)
  double fontSizeDefault(BuildContext context) => getBaseFontSize(context, 18, 20, 22) * scaleText.value;

  /// Large Text (e.g., section titles, product names)
  double fontSizeLarge(BuildContext context) => getBaseFontSize(context, 20, 22, 24) * scaleText.value;

  /// Extra Large Text (e.g., main category titles, headlines)
  double fontSizeExtraLarge(BuildContext context) => getBaseFontSize(context, 24, 26, 28) * scaleText.value;

  /// Over Large Text (e.g., promotional banners, hero text)
  double fontSizeOverLarge(BuildContext context) => getBaseFontSize(context, 30, 32, 34) * scaleText.value;
}
