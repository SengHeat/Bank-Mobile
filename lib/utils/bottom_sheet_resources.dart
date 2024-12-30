
import 'package:bank_mobile_app/constant/routes/api/app_constant.dart';
import 'package:bank_mobile_app/controllers/localication_controller.dart';
import 'package:bank_mobile_app/controllers/responsive_font_size_controller.dart';
import 'package:bank_mobile_app/controllers/theme_controller.dart';
import 'package:bank_mobile_app/theme/color_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetResources {

  static void showThemeSelectionSheet(BuildContext context) {
    final ThemeController themeController = Get.find();
    final LocalizationController localizationController = Get.find();

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(
            'user_theme_system'.tr, // Localized title
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                themeController.setThemeMode(ThemeMode.system);
                Navigator.of(context).pop(); // Close the BottomSheet
                Get.snackbar('success'.tr, 'Theme set to System Mode'); // Confirmation
              },
              child: Text('system_mode'.tr), // Localized text
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                themeController.setThemeMode(ThemeMode.light);
                Navigator.of(context).pop();
                Get.snackbar(
                  'success'.tr,
                  'system_mode'.tr,
                  titleText: Text(
                    'success'.tr,
                    style: TextStyle(
                      color: ColorResources.successColor,
                      fontWeight: FontWeight.bold, // Title font weight
                    ),
                  ),
                  messageText: Text(
                    'system_mode'.tr,
                    style: TextStyle(
                      color: ColorResources.getWhiteColor(context),
                    ),
                  ),
                  backgroundColor: ColorResources.getBackgroundColor(context),
                ); // Confirmation
              },
              child: Text('light_mode'.tr), // Localized text
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                themeController.setThemeMode(ThemeMode.dark);
                Navigator.of(context).pop(); // Close the BottomSheet
                Get.snackbar('success'.tr, 'Theme set to Dark Mode'); // Confirmation
              },
              child: Text('dark_mode'.tr), // Localized text
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop(); // Close the BottomSheet
            },
            child: Text('cancel'.tr), // Localized text
          ),
        );
      },
    );
  }

  static void showTextSizeBottomSheet(BuildContext context) {
    final ResponsiveFontSizeController fontSizeController = Get.find();

    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text(
            'Adjust Text Size',
            style: TextStyle(fontSize: fontSizeController.fontSizeLarge(context)),
          ),
          message: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                double currentScale = fontSizeController.scaleText.value.clamp(0.8, 1.4);

                return Column(
                  children: [
                    Text(
                      'Current Text Size: ${currentScale.toStringAsFixed(1)}x',
                      style: TextStyle(fontSize: fontSizeController.fontSizeDefault(context)),
                    ),
                    const SizedBox(height: 16),
                    CupertinoSlider(
                      value: currentScale,
                      min: 0.8,
                      max: 1.4,
                      divisions: 5,
                      onChanged: (double value) {
                        fontSizeController.updateTextScale(value);
                      },
                      activeColor: CupertinoColors.activeBlue,
                      thumbColor: CupertinoColors.lightBackgroundGray, // Inactive track color
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey5,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${currentScale.toStringAsFixed(1)}x',
                        style: TextStyle(fontSize: fontSizeController.fontSizeMedium(context)),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context); // Close the bottom sheet
            },
            child: Text('cancel'.tr),
          ),
        );
      },
    );
  }

  static void showLanguageBottomSheet(BuildContext context, LocalizationController localizationController) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('choose_language'.tr),
          actions: AppConstant.languages.map((language) {
            return CupertinoActionSheetAction(
              onPressed: () {
                localizationController.changeLanguage(language.languageCode ?? "en", language.countryCode ?? "en");
                Get.back();
              },
              child: Text(language.languageName?.toLowerCase().tr ?? "English"),
            );
          }).toList(),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Get.back();
            },
            isDestructiveAction: true,
            child: Text('cancel'.tr),
          ),
        );
      },
    );
  }

/*  Widget subscriptionBottomSheet({
    required bool isPopular,
    required String price,
    required String amount,
    required String duration,
    required String subscriptionType,
  }) {
    PageController pageController = PageController();
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final double maxHeight = constraints.maxHeight;
            double minimum = 0.3;
            double maximum = 0.55;
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: maxHeight * minimum,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(color: Colors.transparent),
                  ),
                ),
                DraggableScrollableSheet(
                  expand: true,
                  snapAnimationDuration: const Duration(milliseconds: 200),
                  initialChildSize: minimum ,
                  minChildSize: minimum,
                  maxChildSize: maximum,
                  builder: (context, scrollController) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 1000), // Duration of the animation
                      curve: Curves.easeInOut,
                      width: Get.width,
                      height: Get.height,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                        ),
                        color: ColorResources.transparentColor,
                      ),
                      child: Container(
                        width: Get.width,
                        height: Get.height,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                          ),
                          color: ColorResources.transparentColor,
                        ),
                        child: PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: pageController,
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (Widget child, Animation<double> animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                  ),
                                  color: ColorResources.getWhiteColor(context),
                                ),
                                child: Column(
                                  key: ValueKey<int>(0),
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0, left: 16.0, right: 16),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Subscription Plan",
                                            style: textStyleMedium.copyWith(
                                              color: ColorResources.getBlackColor(context),
                                              // fontSize: fontSize.fontSizeDefault,
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () => Get.back(),
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              height: 30,
                                              width: 60,
                                              child: Tab(
                                                icon: Image.asset(
                                                  "assets/icons/remove.png",
                                                  color: ColorResources.getBlackColor(context).withOpacity(0.6),
                                                  height: 18,
                                                  width: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: CustomSubscriptionCard(
                                        subscriptionType: subscriptionType,
                                        pricePerMonth: price,
                                        amount: amount,
                                        duration: duration,
                                        isPopular: isPopular,
                                        onTap: (){},
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                          color: ColorResources.greyBackgroundColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8.0),
                                                child: Text(
                                                  "Premium Version",
                                                  style: textStyleLowMedium.copyWith(
                                                      color: ColorResources.blackColor,
                                                      fontSize: fontSize.fontSizeMedium,
                                                      fontWeight: FontWeight.w700,
                                                      height: 1.5
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 32.0),
                                              RichText(
                                                text: TextSpan(
                                                  style: textStyleLowMedium.copyWith(
                                                      color: ColorResources.blackColor,
                                                      fontSize: fontSize.fontSizeMedium,
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.3
                                                  ),
                                                  children: [
                                                    TextSpan(text: "Cancel at anytime in "),
                                                    TextSpan(
                                                      text: "Settings",
                                                      style: textStyleLowMedium.copyWith(fontWeight: FontWeight.bold, fontSize: fontSize.fontSizeSmall),
                                                    ),
                                                    TextSpan(text: " > "),
                                                    TextSpan(
                                                      text: "Subscription",
                                                      style: textStyleLowMedium.copyWith(fontWeight: FontWeight.bold, fontSize: fontSize.fontSizeSmall),
                                                    ),
                                                    TextSpan(text: " > "),
                                                    TextSpan(
                                                      text: "Manage Your Plan",
                                                      style: textStyleLowMedium.copyWith(fontWeight: FontWeight.bold, fontSize: fontSize.fontSizeSmall),
                                                    ),
                                                    TextSpan(text: " > "),
                                                    TextSpan(
                                                      text: "Cancel Subscription",
                                                      style: textStyleLowMedium.copyWith(fontWeight: FontWeight.bold, fontSize: fontSize.fontSizeSmall),
                                                    ),
                                                    TextSpan(
                                                      text: " at least a day before each renewal date. Plan automatically renews until canceled.\n\n",
                                                    ),
                                                    TextSpan(
                                                      text: "Account: ",
                                                      style: textStyleLowMedium.copyWith(fontWeight: FontWeight.bold),
                                                    ),
                                                    TextSpan(
                                                      text: profileController.userProfileResModel.userDetail?.email ?? "",
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0, left: 16.0, right: 16.0, bottom: 48.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$$amount Per year",
                                            style: textStyleLowMedium.copyWith(
                                              color: ColorResources.primaryColor,
                                              fontWeight: FontWeight.w900,
                                              fontSize: fontSize.fontSizeExtraLarge,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120,
                                            height: 45,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets.symmetric(vertical: 12.0),
                                                backgroundColor: ColorResources.primaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12.0),
                                                ),
                                              ),
                                              onPressed: () async {
                                                HapticFeedback.lightImpact(); // Provides haptic feedback
                                                pageController.animateToPage(
                                                  1,
                                                  duration: const Duration(milliseconds: 300),
                                                  curve: Curves.easeInOut,
                                                ).then((_) {
                                                  setState(() {
                                                    minimum = 0.55;
                                                    profileController.subscriptionPrice.value = double.parse(amount);
                                                  });
                                                });
                                              },
                                              child: Text(
                                                "Confirm",
                                                style: textStyleLowMedium.copyWith(
                                                  color: ColorResources.whiteColor,
                                                  fontSize: fontSize.fontSizeDefault,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (Widget child, Animation<double> animation) {
                                // Use FadeTransition for smoother transitions
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                  ),
                                  color: ColorResources.transparentColor,
                                ),
                                child: Column(
                                  key: ValueKey<int>(1), // Unique key for each child
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: Get.height * 0.25,
                                        color: ColorResources.transparentColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(20.0),
                                            topLeft: Radius.circular(20.0),
                                          ),
                                          color: ColorResources.whiteBackgroundColor,
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 12.0, left: 16.0, right: 16),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Save payment method",
                                                    style: textStyleMedium.copyWith(
                                                      color: ColorResources.blackColor,
                                                      fontSize: fontSize.fontSizeDefault,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  InkWell(
                                                      onTap: () {
                                                        pageController.animateToPage(
                                                          2,
                                                          duration: const Duration(milliseconds: 300),
                                                          curve: Curves.easeInOut,
                                                        ).then((_) {
                                                          setState(() {
                                                          });
                                                        });
                                                      },
                                                      child: Text(
                                                        "Other option",
                                                        style: textStyleMedium.copyWith(color: ColorResources.primaryColor),
                                                      )
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 12.0),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                              child: CustomCardWidget.bankAccountCard(
                                                context,
                                                onTap: (){},
                                                idCard: StringFormat.maskCode("088 6559969", 5),
                                                imageCard: "assets/images/aba_payment.png",
                                                subtitle: "Expire: 2028-07-19",
                                                suffixImage: "assets/icons/check_mark.png",
                                                isShowSuffix: true,
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 12.0, left: 16.0, right: 16.0, bottom: 48.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: Get.width - 32,
                                                    height: 45,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                                                        backgroundColor: ColorResources.primaryColor,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(12.0),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        nextScreenReplace(context, CustomLoadingScreen());
                                                      },
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Pay Now",
                                                              style: textStyleLowMedium.copyWith(
                                                                color: ColorResources.whiteColor,
                                                                fontSize: fontSize.fontSizeDefault,
                                                                fontWeight: FontWeight.w800,
                                                              ),
                                                            ),
                                                            Spacer(),
                                                            Text(
                                                              "\$${profileController.subscriptionPrice.value}",
                                                              style: textStyleLowMedium.copyWith(
                                                                color: ColorResources.whiteColor,
                                                                fontSize: fontSize.fontSizeDefault,
                                                                fontWeight: FontWeight.w800,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 1500),
                              transitionBuilder: (Widget child, Animation<double> animation) {
                                return FadeTransition(
                                    opacity: animation,
                                    child: child
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                  ),
                                  color: ColorResources.transparentColor,
                                ),
                                child: Column(
                                  key: ValueKey<int>(3), // Unique key for each child
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Container(
                                        height: Get.height * 0.25,
                                        color: ColorResources.transparentColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(20.0),
                                            topLeft: Radius.circular(20.0),
                                          ),
                                          color: ColorResources.whiteBackgroundColor,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 16.0,top: 12.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      HapticFeedback.lightImpact(); // Provides haptic feedback
                                                      pageController.animateToPage(
                                                        1,
                                                        duration: const Duration(milliseconds: 300),
                                                        curve: Curves.easeInOut,
                                                      ).then((_) {
                                                        setState(() {});
                                                      });
                                                    },
                                                    child: Icon(Icons.arrow_back_ios),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 12.0, right: 16),
                                                  child: Text(
                                                    "Choose way to pay",
                                                    style: textStyleMedium.copyWith(
                                                      color: ColorResources.blackColor,
                                                      fontSize: fontSize.fontSizeDefault,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                              child: CustomCardWidget.bankAccountCard(
                                                context,
                                                onTap: () => setState(() => nextScreen(context, ABALinkAccountScreen())),
                                                idCard: "ABA PAY",
                                                imageCard: "assets/images/logo_khqr.png",
                                                subtitle: "Scan ot pay with any bank app",
                                                suffixImage: "assets/icons/arrow_right.png",
                                                isShowSuffix: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }*/

  final textStyleMedium = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  );
}
