
class RoutesName {
  // Authentication routes
  static const String splashScreen = "splash_screen";
  static const String appScreen = "app_screen";
  static const String loginScreen = "login_screen";
  static const String registerScreen = "register_screen";
  static const String forgotPasswordScreen = "forgot_password_screen";

  // Main app routes
  static const String homeScreen = "home_screen";
  static const String favoriteScreen = "favorit_screen";
  static const String scanQrScreen = "scan_qr_screen";
  static const String generateQrScreen = "generate_qr_screen";
  static const String profileScreen = "profile_screen";
  static const String settingsScreen = "settings_screen";
  static const String notificationsScreen = "notifications_screen";

  // Item or content related routes
  static const String addNewScreen = "add_new_screen";
  static const String editItemScreen = "edit_item_screen";
  static const String itemDetailScreen = "item_detail_screen";

  // Utility routes
  static const String aboutScreen = "about_screen";
  static const String contactUsScreen = "contact_us_screen";
  static const String termsAndConditionsScreen = "terms_and_conditions_screen";
  static const String privacyPolicyScreen = "privacy_policy_screen";

  // Miscellaneous routes
  static const String searchScreen = "search_screen";
  static const String helpScreen = "help_screen";
  static const String faqScreen = "faq_screen";
  static const String languageSettingsScreen = "language_settings_screen";
  static const String appThemeScreen = "app_theme_screen";

  // Example for dynamic routes if needed
  static  String itemDetailWithIdScreen(String id) => "item_detail_screen/$id";
  static String userProfileWithIdScreen(String userId) => "user_profile_screen/$userId";
}
