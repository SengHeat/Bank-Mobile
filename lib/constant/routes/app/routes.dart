import 'package:bank_mobile_app/constant/routes/app/route_name.dart';
import 'package:bank_mobile_app/views/app/app_screen.dart';
import 'package:bank_mobile_app/views/screen/favorite/favorite_screen.dart';
import 'package:bank_mobile_app/views/screen/simple/generate_qr.dart';
import 'package:bank_mobile_app/views/screen/home/home_screen.dart';
import 'package:bank_mobile_app/views/screen/simple/niti.dart';
import 'package:bank_mobile_app/views/screen/simple/qr_scanner_screen.dart';
import 'package:bank_mobile_app/views/screen/system/change_language_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../views/screen/system/change_theme_screen.dart';
class Routes {
  static Route<bool?> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.appScreen:
        return _buildPageRoute(AppScreen());
      case RoutesName.homeScreen:
        return _buildPageRoute(AppScreen());
      case RoutesName.scanQrScreen:
        return CupertinoPageRoute(
          builder: (context) => FadePageWrapper(child:  QrScannerScreen( )),
        );
      case RoutesName.generateQrScreen:
        return CupertinoPageRoute(
          builder: (context) => FadePageWrapper(child:  QrGenerateScreen()),
        );
      case RoutesName.favoriteScreen:
        return CupertinoPageRoute(
          builder: (context) => FadePageWrapper(child:  ChangeThemeScreen()),
        );
      // case RoutesName.splashScreen:
      //   return _buildPageRoute(
      //     const SplashView(),
      //   );
      default:
        return _buildPageRoute(
          const Scaffold(
            body: Center(
              child: Text(
                "No Route Found",
                style: TextStyle(fontFamily: "Poppins"),
              ),
            ),
          ),
        );
    }
  }

  static PageRouteBuilder<bool?> _buildPageRoute(Widget page) {
    return PageRouteBuilder<bool?>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide starts from right
        const end = Offset.zero; // Ends at the center
        const curve = Curves.easeInOut;
        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}

class FadePageWrapper extends StatelessWidget {
  final Widget child;
  const FadePageWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,  // Full opacity for the new screen
      duration: const Duration(milliseconds: 350),  // Fade-in effect duration
      curve: Curves.easeInOut,  // Smooth transition
      child: child,  // The page that is being pushed
    );
  }
}