// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'package:bank_mobile_app/constant/routes/api/app_constant.dart';
import 'package:bank_mobile_app/data/api/api_client.dart';
import 'package:camera/camera.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  AuthRepository({required this.dioClient, required this.sharedPreferences});

  Future<void> saveUserToken({String? token}) async {
    dioClient.updateHeader(oldToken: token);
    try {
      await sharedPreferences.setString(AppConstant.token, token ?? "");
    } catch (e) {
      throw e.toString();
    }
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstant.token);
  }

  Future<Response> getUpdateVersion() async {
    try {
      final response = await dioClient.getData(AppConstant.getUpdaterVersion);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> register ( String firstName, String lastName,String email, String password,String confirmPassword, String deviceToken, String referralCode) async {
    Map<String, dynamic> body = {
      'first_name' : firstName,
      'last_name' : lastName,
      //"gender": gender,
      // "phone": phoneNumber,
      // "phone_code": "855",
      "email": email,
      /*"otp_verify_code": "123456",*/
      "password": password,
      "password_confirmation": confirmPassword,
      "accepted_terms_conditions": 1,
      "device_token": deviceToken,
      "referral_code" : referralCode,
    };
    try {
      Response response = await dioClient.postData(
        AppConstant.authRegister, body,
        headers: {
          'Content-Type': 'application/json',
        }
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
  //TODO: verify email code OTP
  Future<Response> verifyEmailCode(String email, String otpEmail) async {
    try {
      final response = await dioClient.postData(
        AppConstant.authVerifyOTP,
        {
          "email": email,
          "otp": otpEmail
        }
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  //TODO: resend email code OTP
  Future<Response> resendEmailCode(String email) async {
    try {
      final response = await dioClient.postData(
        AppConstant.authResendOTP,
        {
          "email": email
        }
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> signInWithPhone() async {
    try {
      Response response = await dioClient.postData(AppConstant.authPhoneSignUp,{});
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> loginWithPhone(String phone, String password, String deviceToken) async {
    try {
      Response response = await dioClient.postData(AppConstant.authLogin, {
        'phone': phone,
        'password': password,
        'device_token': deviceToken
      });
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> loginWithEmail(String email, String password, String deviceToken) async {
    try {
      Response response = await dioClient.postData(AppConstant.authLogin, {
        'email': email,
        'password': password,
        'device_token': deviceToken
      });
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> changeAvatar(String uuid) async {
    try {
      final response = await dioClient.postData(AppConstant.authChangeAvatar, {'storage_uuid': uuid});
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> uploadAvatar(XFile file) async {
    try {
      final response = await dioClient.postMultipartData(AppConstant.authUserProfile, {}, [MultipartBody('file', file)]);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> changeName(String name) async {
    try {
      Response response = await dioClient.postData(AppConstant.authChangeUserName, {'name': name,});
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppConstant.token);
    return true;
  }

  Future<Response> sendOTP(String phone, String phoneCode) async {
    Map<String, String> body = {
      "phone": phone,
      "phone_code": phoneCode.substring(1)
    };
    try {
      final response = await dioClient.postData(
          AppConstant.authSendVerificationSMS, body,
          headers: {'Content-Type': 'application/json'}
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> sendOTPEmail(String email) async {
    Map<String, String> body = {
      "email": email
    };
    try {
      final response = await dioClient.postData(
          AppConstant.authSendOTPWithEmail, body
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> resetNewPassword({required String email, required String otp,required String password, required String confirmPassword}) async {

    Map<String, dynamic> body = {
      "email": email,
      "otp": otp,
      "new_password": password,
      "new_password_confirmation": confirmPassword
    };
    try {
      final response = await dioClient.postData(
          AppConstant.authResetPassword, body,
          headers: {'Content-Type': 'application/json'}
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }


  Future<Response> verifyOtp(String phone, String phoneCode, String otpCode) async {
    Map<String, String> body = {
      "phone": phone,
      "phone_code": phoneCode,
      "verification_code": otpCode
    };
    try {
      final response = await dioClient.postData(
          AppConstant.authVerifyOTP, body,
        headers: {'Content-Type': 'application/json'}
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> signOut(String deviceID) async {
    try {
      final response = await dioClient.postData(
          AppConstant.authLogout,
        {
          "device_token": deviceID
        }
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
  //TODO: delete Account
  Future<Response> deleteAccount() async {
    try {
      if(isLoggedIn()) {
        final response = await dioClient.deleteData(
          AppConstant.authDeleteAccount,
        );
        return response;
      } else {
        final response = await dioClient.deleteData(
          AppConstant.authDeleteAccount,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer',
          }
        );
        return response;
      }
    } catch (e) {
      // Properly handle any errors
      throw Exception('Failed to delete account: ${e.toString()}');
    }
  }



  Future changePhoneNumber({required String phone, required String phoneCode, required String pin, required String otp}) async{
    try{
      final response = await dioClient.postData(AppConstant.authChangePhoneNumber, {
        "phone" : phone,
        "phone_code" : phoneCode,
        "pin" : pin,
        "verification_code" : otp
      });
      return response;
    } catch(e){
      throw e.toString();
    }
  }

  Future<Response> createNewPassword({
    required String phone,
    required String phoneCode,
    required String verificationCode,
    required String newPassword,
    required String confirmPassword,
  }) async {
    Map<String, String> body = {
      'phone': phone,
      'phone_code': phoneCode,
      "verification_code": verificationCode,
      'new_password': newPassword,
      'confirm_password': confirmPassword
    };
    try {
      final response = await dioClient.postData(AppConstant.authResetPassword, body,headers: {
        'Content-Type': 'application/json',
      });
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> checkPassword(String phone, String phoneCode,String oldPassword) async {
    try {
      final response = await dioClient.postData(
          AppConstant.authChangePassword,
        {
          'phone': phone,
          'phone_code': phoneCode,
          'old_password': oldPassword,
        }
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> checkCurrentPassword(String currentPassword) async {
    try {
      final response = await dioClient.postData(AppConstant.authChangePhoneNumber, {'current_password': currentPassword});
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> changePassword(String currentPassword, String newPassword, String confirmPassword) async {
    try {
      final response = await dioClient.postData(
          AppConstant.authChangePassword,
        {
          'current_password': currentPassword,
          'new_password': newPassword,
          'confirm_password': confirmPassword,
        }
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> resetDeviceToken(String email) async {
    try {
      final response = await dioClient.postData(
        AppConstant.authDeviceInfo,
        {
          'email': email,
        },
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> getNotification() async {
    try {
      final response = await dioClient.getData(AppConstant.notificationsGetAll);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}


