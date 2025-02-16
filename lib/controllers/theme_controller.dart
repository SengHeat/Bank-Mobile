
import 'package:bank_mobile_app/constant/routes/api/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {

  final SharedPreferences sharedPreferences;
  ThemeController({required this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  var themeMode = ThemeMode.system.obs;

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    if (themeMode.value == ThemeMode.system) {
      themeMode.value = ThemeMode.light;
    } else if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.system;
    }
    Get.changeThemeMode(themeMode.value);
  }

  setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
  }

  void _loadCurrentTheme() async {
    _darkTheme = sharedPreferences.getBool(AppConstant.theme) ?? false;
    update();
  }
}
