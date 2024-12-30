// ignore_for_file: prefer_const_constructors

import 'package:bank_mobile_app/controllers/responsive_font_size_controller.dart';
import 'package:bank_mobile_app/theme/color_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbarWidget {

  static SliverAppBar buildSliverAppBar(
      BuildContext context, { required bool isBack, required String title,}) {
    final ResponsiveFontSizeController responsiveFontSizeController = Get.find<ResponsiveFontSizeController>();
    return SliverAppBar(
      backgroundColor: ColorResources.getPrimaryColor(context),
      leading: isBack ? GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 60,
          width: 60,
          child: Center( // Centering the icon
            child: Icon(CupertinoIcons.left_chevron),
          ),
        ),
      ) : null,
      title: Text(
        title,
        style: TextStyle(
          color: ColorResources.getAppBarTextColor(context),
          fontSize: responsiveFontSizeController.fontSizeDefault(context),
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(12.0),
            topLeft: Radius.circular(12.0)
        ),
      ),
      centerTitle: true,
      pinned: true,
    );
  }

  static AppBar buildAppBar(
      BuildContext context, {required String title}) {
    return AppBar(
      backgroundColor: ColorResources.getPrimaryColor(context),
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 60,
          width: 60,
          child: Center( // Centering the icon
            child: Icon(CupertinoIcons.left_chevron),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: ColorResources.getAppBarTextColor(context),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

}
