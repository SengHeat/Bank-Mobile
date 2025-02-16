
import 'package:bank_mobile_app/component/style/color_resources.dart';
import 'package:bank_mobile_app/component/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin HomeMixin {


  LinearGradient backgroundColor(BuildContext context) {
    return LinearGradient(
      colors: [
        ColorResource.bluishGreyColor.withOpacity(0.2),
        ColorResource.greenColor.withOpacity(0.4),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }

  Widget buttonClickCircle({required String title, required String icon, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(1.5),
        width: 65,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorResource.bluishGreyColor
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.all(6.0),
              child: Icon(
                Icons.credit_card,
                size: 45,
              ),
            ),
            Text(
              title,
              style: textStyleBig.copyWith(
                  color: ColorResource.greyColor,
                  fontSize: 18
              ),
            )
          ],
        ),
      ),
    );
  }

}