import 'dart:async';
import 'package:bank_mobile_app/constant/routes/api/app_constant.dart';
import 'package:bank_mobile_app/constant/routes/app/route_name.dart';
import 'package:bank_mobile_app/constant/routes/app/routes.dart';
import 'package:bank_mobile_app/controllers/localication_controller.dart';
import 'package:bank_mobile_app/controllers/responsive_font_size_controller.dart';
import 'package:bank_mobile_app/controllers/theme_controller.dart';
import 'package:bank_mobile_app/utils/message.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'helper/get_di.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// final FirebaseAPI firebaseAPI = FirebaseAPI();

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Firebase.initializeApp();

    FirebaseMessaging messaging = FirebaseMessaging.instance;


    // Request notification permissions
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not granted permission');
    }
    Map<String, Map<String, String>> languages = await di.init();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.red,
      statusBarIconBrightness: Brightness.dark,
    ));

    runApp(MyApp(languages: languages));
  }, (error, stack) {
    if (kDebugMode) {
      print("Error: $error\nStacktrace: $stack");
    }
  });
}


class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>> languages;

  const MyApp({super.key, required this.languages});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late final ThemeController themeController;
  final ResponsiveFontSizeController fontSizeController = Get.put(ResponsiveFontSizeController());
  late LocalizationController localizationController;
  Future<void>? _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = init();
  }

  Future<void> init() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    themeController = Get.put(ThemeController(sharedPreferences: await SharedPreferences.getInstance()));
    localizationController = Get.put(LocalizationController(sharedPreferences: sharedPreferences));
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,  // Assume _initialization is your async initialization (e.g., Firebase)
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return Obx(() {
          return GetMaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeController.themeMode.value,
            translations: Messages(languages: widget.languages),
            locale: localizationController.locale,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale(AppConstant.languages[0].languageCode!, AppConstant.languages[0].countryCode),
              Locale(AppConstant.languages[1].languageCode!, AppConstant.languages[1].countryCode),
              Locale(AppConstant.languages[2].languageCode!, AppConstant.languages[2].countryCode),
            ],
            localeListResolutionCallback: (locales, supportedLocales) {
              for (var locale in locales!) {
                if (supportedLocales.contains(locale)) {
                  return locale;
                }
              }
              return supportedLocales.first;
            },
            fallbackLocale: Locale(AppConstant.languages[0].languageCode!, AppConstant.languages[0].countryCode),
            onGenerateRoute: Routes.generateRoutes,
            initialRoute: RoutesName.homeScreen,
          );
        });
      },
    );
  }
}
