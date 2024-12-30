
import 'package:bank_mobile_app/constant/routes/api/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationController extends GetxController {

  final SharedPreferences sharedPreferences;

  LocalizationController({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }
  RxString language = "en".obs;
  final RxInt _currentLanguageIndex = (0).obs;

  Locale _locale = Locale(AppConstant.languages[0].languageCode.toString(), AppConstant.languages[0].countryCode);

  Locale get locale => _locale;

  RxInt get currentLanguageIndex => _currentLanguageIndex;


  changeLanguage(String languageCode, String countryCode) {
    Locale newLocale = Locale(languageCode, countryCode);
    Get.updateLocale(newLocale);
    _locale = newLocale;
    language.value = languageCode;
    saveLanguage(languageCode, countryCode);
    update();
  }

  loadCurrentLanguage() {
    String? languageCode = sharedPreferences.getString('languageCode') ?? AppConstant.languages[0].languageCode;
    String? countryCode = sharedPreferences.getString('countryCode') ?? AppConstant.languages[0].countryCode;
    _locale = Locale(languageCode!, countryCode);
    language.value = languageCode;
  }

  saveLanguage(String languageCode, String countryCode) async {
    await sharedPreferences.setString('languageCode', languageCode);
    await sharedPreferences.setString('countryCode', countryCode);
  }

  setCurrentLanguage(int value) => _currentLanguageIndex.value = value;

}
