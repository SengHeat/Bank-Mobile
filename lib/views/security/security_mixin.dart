
import 'package:bank_mobile_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:url_launcher/url_launcher.dart';

mixin SecurityMixin {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> _checkBiometricSupport() async {
    bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
    return canCheckBiometrics;
  }
  Future<void> _navigateToHomeScreen(String routeName) async {
    Get.toNamed(routeName);
    // final url = Uri.parse("https://app.scholarar.com/thank-you");
    // if (await canLaunchUrl(url)) {
    //   await launchUrl(url, mode: LaunchMode.externalApplication);
    // } else {
    //   // Handle the error when the URL cannot be launched
    //   print("Could not launch $url");
    // }
  }

  Future<void> authenticateWithBiometrics({required String routeName}) async {
    try {
      bool isSupported = await _checkBiometricSupport();
      if (!isSupported) {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Biometric authentication is not supported on this device')),
        );
        return;
      }

      bool isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Please authenticate using Face ID or Touch ID', // Message shown on authentication prompt
        options: const AuthenticationOptions(
          useErrorDialogs: true, // Automatically show error dialogs on failure
          stickyAuth: true, // Keep authentication active until success or cancellation
          biometricOnly: true, // Only allow biometric authentication
        ),
      );

      if (isAuthenticated) {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Biometric Authentication Successful')),
        );
        _navigateToHomeScreen(routeName); // Navigate to HomeScreen on success
      } else {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Biometric Authentication Failed')),
        );
      }
    } catch (e) {
      print('Error during biometric authentication: $e');
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Biometric Authentication Error')),
      );
    }
  }

  Future<void> authenticateWithPasscode({required String routeName}) async {
    try {
      bool isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Please authenticate using your passcode', // Message for passcode authentication
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
      if (isAuthenticated) {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Passcode Authentication Successful')),
        );
        _navigateToHomeScreen(routeName);
      } else {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Passcode Authentication Failed')),
        );
      }
    } catch (e) {
      print('Error during passcode authentication: $e');
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Passcode Authentication Error')),
      );
    }
  }

}