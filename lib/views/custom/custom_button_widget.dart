
import 'package:bank_mobile_app/component/style/color_resources.dart';
import 'package:bank_mobile_app/controllers/responsive_font_size_controller.dart';
import 'package:bank_mobile_app/theme/color_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomButtonWidget {

  static Widget buildButtonClick(BuildContext context,{required Function() onTap, required String title}) {
    final ResponsiveFontSizeController responsiveFontSizeController = Get.find<ResponsiveFontSizeController>();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      alignment: Alignment.center,
      height: 45,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: MediaQuery.of(context).size.width,
        pressedOpacity: 0.7,
        color: CupertinoColors.activeBlue,
        onPressed: onTap,
        child: Text(title.tr,style: TextStyle(
          color: ColorResources.errorColor,
          fontWeight: FontWeight.w700,
          wordSpacing: 1.6,
          letterSpacing: 1.3,
          fontSize: responsiveFontSizeController.fontSizeMedium(context),
        ),),
      ),
    );
  }

}