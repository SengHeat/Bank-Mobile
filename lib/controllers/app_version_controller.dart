/*


import 'dart:convert';

import 'package:flutter_dart_structure/data/api/api_client.dart';
import 'package:flutter_dart_structure/data/model/api_model/version_app_res_model.dart';
import 'package:flutter_dart_structure/data/repository/app_version_repository.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppVersionController extends GetxController implements GetxService {

  DioClient? dioClient;
  late final SharedPreferences sharedPreferences;
  final AppVersionRepository appVersionRepository;
  AppVersionController({required this.appVersionRepository, required this.sharedPreferences});

  VersionResModel _versionResModel = VersionResModel();

  VersionResModel get versionResModel => _versionResModel;

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: "Unknown",
    installerStore: "Unknown"
  );


  @override
  void onInit() async {
    super.onInit();
    await Future.wait([
      getVersionLocal(),
      fetchVersionApp(),
    ]);
    // print(_packageInfo);
  }

  Future fetchVersionApp() async {
    try {
      final response = await appVersionRepository.getUpdateVersion();
      if(response.body['status'] == 200) {
        _versionResModel = VersionResModel.fromJson(response.body['data'][0]);
        update();
      } else {
        update();
      }
    } catch (e) {
      throw Exception("Connect to API Error");
    }
  }

  Future<void> getVersionLocal() async {
    try {
      final info = await PackageInfo.fromPlatform();
      print("App Name: ${info.appName}");
      print("Package Name: ${info.packageName}");
      print("Version: ${info.version}");
      print("Build Number: ${info.buildNumber}");
    } catch (e) {
      print("Error: $e");
    }
  }


  // Future<void> _init() async {
  //   await _initPackageInfo();
  //   await _authController.getUpdateVersion();
  //
  //   if (!updatePromptShown) {
  //     print("Update Prompt Shown: $updatePromptShown");
  //     var appStoreVersion = _authController
  //         .updaterVersion?[0]["app_store_version"];
  //     var playStoreVersion = _authController
  //         .updaterVersion?[0]["play_store_version"];
  //     bool requiredUpdate = _authController
  //         .updaterVersion?[0]["require_update"] ?? false;
  //     setState(() {
  //       if (Platform.isAndroid) {
  //         _newVersion = playStoreVersion;
  //       } else {
  //         _newVersion = appStoreVersion;
  //       }
  //       oldVersion = _packageInfo.version;
  //       if (_newVersion != null && oldVersion != null && Version.parse(_newVersion!) > Version.parse(oldVersion!)) {
  //         _needsUpdate = true;
  //         _requiredUpdate = requiredUpdate;
  //       } else {
  //         _needsUpdate = false;
  //       }
  //     });
  //   }
  //
  // }


  // final appVersionController = Get.put(AppVersionController());
  //
  // void checkForUpdate() async {
  //   await appVersionController.fetchVersionApp();
  //
  //   if (appVersionController.needsUpdate.value) {
  //     if (appVersionController.requiredUpdate.value) {
  //       print("An update is required!");
  //     } else {
  //       print("An update is available but not mandatory.");
  //     }
  //   } else {
  //     print("Your app is up-to-date.");
  //   }
  // }

}*/
