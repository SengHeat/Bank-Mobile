import 'package:bank_mobile_app/main.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocalAuthentication _localAuth = LocalAuthentication();
  // static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Check if the device supports biometric authentication (Face ID, Fingerprint)
  Future<bool> _checkBiometricSupport() async {
    bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
    return canCheckBiometrics;
  }

  // Navigate to HomeScreen after successful authentication using NavigatorKey
  void _navigateToHomeScreen() {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  Future<void> _authenticateWithBiometrics() async {
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
        _navigateToHomeScreen(); // Navigate to HomeScreen on success
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

  Future<void> _authenticateWithPasscode() async {
    try {
      bool isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Please authenticate using your passcode', // Message for passcode authentication
        options: const AuthenticationOptions(
          useErrorDialogs: true, // Automatically show error dialogs on failure
          stickyAuth: true, // Keep authentication active until success or cancellation
          biometricOnly: false, // Allow passcode (without biometric)
        ),
      );
      if (isAuthenticated) {
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Passcode Authentication Successful')),
        );
        _navigateToHomeScreen(); // Navigate to HomeScreen on success
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // Use the global navigator key
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Authentication Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _authenticateWithBiometrics, // Trigger Face ID / Biometric authentication
                child: const Text('Authenticate with Face ID'),
              ),
              SizedBox(height: 26),
              ElevatedButton(
                onPressed: _authenticateWithPasscode, // Trigger passcode authentication
                child: const Text('Authenticate with Passcode'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: const Text('Authentication Successful!'),
      ),
    );
  }
}
