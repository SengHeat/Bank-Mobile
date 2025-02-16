import 'package:bank_mobile_app/constant/routes/app/route_name.dart';
import 'package:bank_mobile_app/controllers/theme_controller.dart';
import 'package:bank_mobile_app/theme/color_resources.dart';
import 'package:bank_mobile_app/views/custom/custom_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChangeThemeScreen extends StatelessWidget {
  ChangeThemeScreen({super.key});
  final ThemeController themeController = Get.find<ThemeController>();
  final RxBool isSwitched = true.obs;
  final RxBool isDarkMode = false.obs;

  @override
  Widget build(BuildContext context) {
    _initializeTheme();

    return Obx(() {
      isDarkMode.value = themeController.themeMode.value == ThemeMode.dark;

      return Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppbarWidget.buildSliverAppBar(context, isBack: true, title: "display".tr),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: Text(
                      "theme".tr,
                      style: TextStyle(
                        color: ColorResources.getBlackColor(context),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12.0),
                    padding: const EdgeInsets.all(12.0),
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      color: ColorResources.getWhiteColor(context),
                    ),
                    alignment: Alignment.center,
                    child: Wrap(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Spacer(),
                                Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                        color: isDarkMode.value ? ColorResources.getOverlayLight(context) : const Color(0xFFF5F5F5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorResources.getBlackColor(context).withOpacity(0.2), // Shadow color
                                            blurRadius: 8.0, // Softens the shadow
                                            spreadRadius: 2.0, // Increases the size of the shadow
                                            offset: const Offset(0, 4), // Changes the position of the shadow
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        HapticFeedback.lightImpact();
                                        themeController.setThemeMode(ThemeMode.light);
                                        isSwitched.value = false; // Set switch to off
                                        isDarkMode.value = false; // Set isDarkMode to false
                                      },
                                      child: _buildThemeCircle(
                                        context,
                                        isSelected: !isDarkMode.value,
                                        isDarkMode: !isDarkMode.value,
                                        title: "light_mode".tr,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                        color: ColorResources.getOverlayDark(context),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorResources.getBlackColor(context).withOpacity(0.2), // Shadow color
                                            blurRadius: 8.0, // Softens the shadow
                                            spreadRadius: 2.0, // Increases the size of the shadow
                                            offset: const Offset(0, 4), // Changes the position of the shadow
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        HapticFeedback.lightImpact();
                                        themeController.setThemeMode(ThemeMode.dark);
                                        isSwitched.value = false; // Set switch to off
                                        isDarkMode.value = true; // Set isDarkMode to true
                                      },
                                      child: _buildThemeCircle(
                                        context,
                                        isSelected: isDarkMode.value,
                                        isDarkMode: isDarkMode.value,
                                        title: "dark_mode".tr,
                                      ),
                                    ),

                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "user_theme_system".tr,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(width: 16),
                                CupertinoSwitch(
                                  value: isSwitched.value,
                                  onChanged: (value) {
                                    Get.toNamed(RoutesName.generateQrScreen);
                                    isSwitched.value = value;
                                    if (value) {
                                      themeController.setThemeMode(ThemeMode.system);
                                      if (themeController.themeMode.value == ThemeMode.dark) {
                                        isDarkMode.value = true;
                                      } else {
                                        isDarkMode.value = false;
                                      }
                                    } else {
                                      themeController.setThemeMode(ThemeMode.light);
                                      isDarkMode.value = false;
                                    }
                                  },
                                ),
                              ],
                            ),
                            Text("user_theme_description".tr), // Ensure localization
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: ColorResources.getBackgroundColor(context),
      );
    });
  }

  void _initializeTheme() {
    // Check the current system theme and set the switch accordingly
    if (themeController.themeMode.value == ThemeMode.system) {
      isSwitched.value = true;
    } else {
      isSwitched.value = false;
    }
  }

  Widget _buildThemeCircle(BuildContext context, {required bool isSelected, required bool isDarkMode, required String title}) {
    return Column(
      children: [
        const SizedBox(height: 12.0,),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w900),),
        Container(
          margin: const EdgeInsets.all(12),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: isSelected ? ColorResources.successColor : (isDarkMode ? ColorResources.getBackgroundColor(context) : ColorResources.getWhiteColor(context)),
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.2,
              color: isSelected ? ColorResources.successColor : (isDarkMode ? ColorResources.getDarkGrey(context) : ColorResources.successColor),
            ),
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: isSelected ? ColorResources.getWhiteColor(context) : ColorResources.transparentColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
