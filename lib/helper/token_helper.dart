import 'dart:convert';
import 'package:bank_mobile_app/constant/routes/api/app_constant.dart';
import 'package:bank_mobile_app/views/screen/home/home_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class TokenHelper {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  final SharedPreferences sharedPreferences = Get.find<SharedPreferences>();

  // Save token to both secure storage and shared preferences
  Future<void> saveToken({required String token}) async {
    await storage.write(key: AppConstant.token, value: token);
    await sharedPreferences.setString(AppConstant.token, token);
  }

  Future<void> saveUUID({required String uuid}) async {
    await storage.write(key: 'uuid', value: uuid);
    await sharedPreferences.setString(AppConstant.userId, uuid);
  }

  Future<void> saveData({required String key, required String value}) async {
    await storage.write(key: key, value: value);
    await sharedPreferences.setString(key, value);
  }

  static List<String> convertStringToListString({required String data}) {
    return List<String>.from(json.decode(data));
  }

  Future<String?> getToken() async {
    String? token = await storage.read(key: AppConstant.token);
    if (token != null) {
      await sharedPreferences.setString(AppConstant.token, token);
    }
    return token;
  }

  Future<String?> getUUID() async {
    return await storage.read(key: 'uuid');
  }

  Future<void> removeToken({bool isNotSignOut = true}) async {
    await storage.delete(key: AppConstant.token);
    await sharedPreferences.remove(AppConstant.token);
  }

  Future<void> saveReferralCode({required String code}) async {
    await storage.write(key: AppConstant.referralCode, value: code);
    await sharedPreferences.setString(AppConstant.referralCode, code);
  }

  Future<String> getReferralCode() async {
    String? referralCode = await storage.read(key: AppConstant.referralCode);
    if (referralCode == null) {
      return '';
    }
    await sharedPreferences.setString(AppConstant.referralCode, referralCode);
    return referralCode;
  }

  Future<void> removeReferralCode() async {
    await storage.delete(key: AppConstant.referralCode);
    await sharedPreferences.remove(AppConstant.referralCode);
  }

  Future<void> clearStorage() async {
    await storage.deleteAll();
    await sharedPreferences.clear();
  }
}

