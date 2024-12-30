
import 'package:bank_mobile_app/data/entity/model/language_model.dart';

class AppConstant {
  // Store URLs
  static const String playStore = "https://play.google.com/store/apps/details?id=com.scholarar.app&pcampaignid=web_share";
  static const String appStore = "https://apps.apple.com/kh/app/scholarar/id6602891343";
  static const String appKey = "Pzu44rLMJgqDC47OWQCMZb1UPsaPse7LHsRPhFM6I70=";

  //Base URL
  static const String apiBaseUrlProduction = "https://devportal.scholarar.com";
  static const String apiBaseUrlDevelopment = "https://staging-portal.scholarar.com";
  static const String apiBaseUrlStaging = "https://portal.scholarar.com";
  static const String apiBaseUrlProductionPVT = "https://pvt-portal.scholarar.com";
  // Auth - Phone-Based Authentication
  static const String authPhoneSignIn = "/api/v1/phone-sign-in";
  static const String authSendVerificationSMS = "/api/v1/send-verification-sms";
  static const String authVerificationCode = "/api/v1/verify-phone-code";
  static const String authPhoneSignUp = "/api/v1/phone-sign-up";
  // Password Management (Email-Based)
  static const String authSendOTPWithEmail = "/api/v1/forgot-password";
  static const String authVerifyOTPWithEmail = "/api/v1/verify-otp-forgotpassword";
  static const String authForgetPassword = "/api/v1/forgot-password";

  // Auth Endpoints
  static const String authRegister = "/api/v1/register";
  static const String authLogin = "/api/v1/login";
  static const String authLogout = "/api/v1/logout";
  static const String authVerifyOTP = "/api/v1/verify-otp";
  static const String authResendOTP = "/api/v1/resend-otp";
  static const String authResetPassword = "/api/v1/reset-password";
  static const String authChangePassword = "/api/v1/change-password";
  static const String authDeleteAccount = "/api/v1/delete-account";

  // Device Information
  static const String authDeviceInfo = "/api/v1/device-info";
  static const String getUpdaterVersion = "/api/versions";

  // Account Management Endpoints
  static const String accountGetDetails = "/api/v1/account/details";
  static const String accountCreate = "/api/v1/account/create";
  static const String accountUpdate = "/api/v1/account/update";
  static const String accountDeactivate = "/api/v1/account/deactivate";
  static const String accountClose = "/api/v1/account/close";

  // Transaction Endpoints
  static const String transactionGetHistory = "/api/v1/transactions/history";
  static const String transactionTransferFunds = "/api/v1/transactions/transfer";
  static const String transactionGetDetails = "/api/v1/transactions/details";
  static const String transactionDeposit = "/api/v1/transactions/deposit";
  static const String transactionWithdraw = "/api/v1/transactions/withdraw";
  static const String transactionCancel = "/api/v1/transactions/cancel";

  // Loan Endpoints
  static const String loanApply = "/api/v1/loans/apply";
  static const String loanGetDetails = "/api/v1/loans/details";
  static const String loanRepay = "/api/v1/loans/repay";
  static const String loanApprove = "/api/v1/loans/approve";
  static const String loanReject = "/api/v1/loans/reject";
  static const String loanGetRepaymentSchedule = "/api/v1/loans/repayment-schedule";

  // Beneficiary Endpoints
  static const String beneficiaryAdd = "/api/v1/beneficiaries/add";
  static const String beneficiaryUpdate = "/api/v1/beneficiaries/update";
  static const String beneficiaryRemove = "/api/v1/beneficiaries/remove";
  static const String beneficiaryGetList = "/api/v1/beneficiaries/list";

  // Security Endpoints
  static const String securityEnable2FA = "/api/v1/security/enable-2fa";
  static const String securityDisable2FA = "/api/v1/security/disable-2fa";
  static const String securityGetActivityLogs = "/api/v1/security/activity-logs";

  // Notifications Endpoints
  static const String notificationsGetAll = "/api/v1/notifications/all";
  static const String notificationsMarkAsRead = "/api/v1/notifications/mark-as-read";

  // Session Management Endpoints
  static const String sessionStart = "/api/v1/session/start";
  static const String sessionEnd = "/api/v1/session/end";
  static const String sessionGetStatus = "/api/v1/session/status";


  // User Profile & Settings
  static const String authUserProfile = "/api/v1/user/profile";
  static const String authChangeUserName = "/api/v1/user/change-username";
  static const String authChangeAvatar = "/api/v1/user/change-avatar";
  static const String authChangePhoneNumber = "/api/v1/user/change-phone-number";


  /// Authentication and user-related keys
  static const String token = "token";
  static const String userId = "user_id";
  static const String referralCode = "referral_code";
  static const String isLoggedIn = "is_logged_in";
  static const String userProfilePicture = "user_profile_picture";
  static const String userFullName = "user_full_name";

  // Language settings
  static const String languageCode = "language_code";
  static const String countryCode = "country_code";

  // Theme settings (for Dark/Light mode)
  static const String theme = "app_theme";
  static const String isDarkMode = "is_dark_mode";

  // App usage settings
  static const String appVersion = "app_version";
  static const String lastLoginTime = "last_login_time";
  static const String appLaunchCount = "app_launch_count";

  // Notification and sound settings
  static const String isNotificationsEnabled = "is_notifications_enabled";
  static const String isSoundEnabled = "is_sound_enabled";
  static const String isVibrationEnabled = "is_vibration_enabled";

  /// Location and sync preferences
  static const String isLocationEnabled = "is_location_enabled";
  static const String isOfflineMode = "is_offline_mode";
  static const String isAutoSyncEnabled = "is_auto_sync_enabled";

  // Onboarding and intro preferences
  static const String isOnboardingCompleted = "is_onboarding_completed";

  // Other settings or preferences
  static const String isFirstLaunch = "is_first_launch";

  // List of supported languages for the app
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: "assets/images/logo_english.png",
        languageName: "English",
        countryCode: "US",
        languageCode: "en"),
    LanguageModel(
        imageUrl: "assets/images/logo_english.png",
        languageName: "Khmer",
        countryCode: "KH",
        languageCode: "km"),
    LanguageModel(
        imageUrl: "assets/images/logo_china.png",
        languageName: "简体中文",
        countryCode: "CN",
        languageCode: "zh")
  ];
}
