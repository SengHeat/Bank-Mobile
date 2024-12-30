
import 'package:bank_mobile_app/constant/routes/api/app_constant.dart';
import 'package:bank_mobile_app/controllers/localication_controller.dart';
import 'package:bank_mobile_app/theme/color_resources.dart';
import 'package:bank_mobile_app/views/custom/custom_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguageScreen extends StatelessWidget {
  ChangeLanguageScreen({super.key});

  final LocalizationController localizationController = Get.find<LocalizationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppbarWidget.buildSliverAppBar(context, isBack: true, title: "language".tr),
          SliverToBoxAdapter(
            child: Wrap(
              children: List.generate(AppConstant.languages.length, (index) {
                final language = AppConstant.languages[index];
                final isLastIndex = index == AppConstant.languages.length - 1;

                return InkWell(
                  onTap: () {
                    localizationController.setCurrentLanguage(index);
                    localizationController.changeLanguage(
                      language.languageCode ?? "en",
                      language.countryCode ?? "en",
                    );
                  },
                  child: Container(
                    height: 55,
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                    margin: const EdgeInsets.only(bottom: 1),
                    decoration: BoxDecoration(
                      color: ColorResources.getWhiteColor(context),
                      boxShadow: [
                        BoxShadow(
                          color: ColorResources.getBlackColor(context).withOpacity(0.2), // Default shadow color
                          blurRadius: 8.0,
                          spreadRadius: 2.0,
                          offset: const Offset(0, 4),
                        ),
                        if (isLastIndex) // Apply lighter shadow only for the last item
                          BoxShadow(
                            color: ColorResources.getBlackColor(context).withOpacity(0.1), // Lighter shadow color
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            offset: const Offset(0, 1),
                          ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(language.imageUrl ?? "assets/default_image.png"),
                            ),
                            const SizedBox(width: 12.0),
                            Text(
                              language.languageName?.toLowerCase().tr ?? "English",
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Radio<int>( // Use int instead of RxInt
                          value: index,
                          groupValue: localizationController.currentLanguageIndex.value,
                          onChanged: (int? value) {
                            if (value != null) {
                              localizationController.setCurrentLanguage(value); // Update selected index
                              localizationController.changeLanguage(
                                language.languageCode ?? "en",
                                language.countryCode ?? "en",
                              );
                            }
                          },
                          activeColor: ColorResources.getPrimaryColor(context),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      backgroundColor: ColorResources.getBackgroundColor(context),
    );
  }
}
