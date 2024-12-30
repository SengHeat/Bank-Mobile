

import 'package:bank_mobile_app/constant/routes/api/app_constant.dart';
import 'package:bank_mobile_app/data/api/api_client.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppVersionRepository {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  AppVersionRepository({required this.dioClient, required this.sharedPreferences});



  Future<Response> getUpdateVersion() async {
    try {
      final response = await dioClient.getData(AppConstant.getUpdaterVersion);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
