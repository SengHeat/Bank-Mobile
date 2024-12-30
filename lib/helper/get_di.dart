

import 'dart:convert';

import 'package:bank_mobile_app/constant/routes/api/app_constant.dart';
import 'package:bank_mobile_app/controllers/theme_controller.dart';
import 'package:bank_mobile_app/data/api/api_client.dart';
import 'package:bank_mobile_app/data/entity/model/language_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {

  //TODO Core
  final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => NetworkInfo(Get.find()));
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => DioClient(appBaseUrl: AppConstant.apiBaseUrlDevelopment, sharedPreferences: Get.find()));

  //TODO Repository
  // Get.lazyPut(() => LanguageRepository());
  // Get.lazyPut(() => AuthRepository(dioClient: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => AppVersionRepository(dioClient: Get.find(), sharedPreferences: Get.find()));

  //TODO Controller
  // Get.lazyPut(() => SplashController());
  // Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find(), dioClient: Get.find()));
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  // Get.lazyPut(() => AuthController(authRepository: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => AppVersionController(appVersionRepository: Get.find(), sharedPreferences: Get.find()));

  Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppConstant.languages) {
    String jsonStringValues = await rootBundle.loadString('assets/languages/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = {};
    mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] = _json;
  }
  return languages;

}