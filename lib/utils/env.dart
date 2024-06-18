class Env {
  // //Base URL
  // static String baseUrl = 'https://dev.minimeal.com/backend/api/v1/';
  // //Payment Key test
  // static String stripePublicKey =
  //     "pk_test_51Mt53PJ9QHUBs5xrMHamJcQaDblO3OOLpZLH2Fuei2B7CMdHyUzznyv6p9hAsiSTb6E3Nh6qMSoTq5nXrEqaqVJE009f0oPysf";

  // Live Url
  static String baseUrl = 'https://minimeal.com/backend/api/v1/';
  //Payment Key production
  static String stripePublicKey =
      "pk_live_51Mt7pyLl7PURCun6hMIYcipWmJQhV7e7ZT95hvNTPmYAKvfPp9Bm60cMMJV0Q8YzjJR63gDnjvgkMYOIoQEbSOxD00R4vnMmnB";

  // API URL
  static String loginUrl = 'private/login';
  static String signupUrl = 'private/signup';
  static String logoutUrl = 'protected/logout';
  static String countryListUrl = 'private/country-list';
  static String appVarsionUrl = 'private/get-app-version';
  static String otpUrl = 'private/auth-account-verification';
  static String getProfileUrl = 'protected/profile-get-data';
  static String forgotPasswordUrl = 'private/forgot-password';
  static String shareCraditUrl = 'protected/get-share-credit';
  static String getStarterDataUrl = 'private/get-language-data';
  static String canSubscribeNowUrl = 'protected/can-subscribe-now';
  static String getOrdersListUrl = 'protected/order-get-order-list';
  static String countryZoneListUrl = 'private/get-country-zone-list';
  static String deleteAccountUrl = 'protected/profile-delete-account';
  static String subscriptionPauseUrl = 'protected/subscription-pause';
  static String subscriptionResumeUrl = 'protected/subscription-resume';
  static String getOrderDetailsUrl = 'protected/order-get-order-detail';
  static String subscriptionCancelUrl = 'protected/subscription-cancel';
  static String forgotPasswordUpdateUrl = 'private/forgot-password-update';
  static String profileUpdateUrl = 'protected/profile-update-personal-data';
  static String getSubscriptionPlanUrl = 'protected/get-subscribe-now-data';
  static String orderInvoiceDownloadUrl = 'protected/order-download-invoice';
  static String getAddressUrl = 'protected/get-subscription-shipping-address';
  static String changePasswordUpdateUrl = 'protected/profile-change-password';
  static String forgotPasswordOtpUrl = 'private/forgot-password-validate-otp';
  static String getSubscriptionStatusUrl = 'protected/get-subscription-status';
  static String subscriptionPaymentStatusUrl =
      'protected/subscription-get-payment-status';
  static String subscriptionInitiateActivationUrl =
      'protected/subscription-initiate-activation';
  static String subscriptionShippingAddressUrl =
      'protected/set-subscription-shipping-address';

  //others url
  static String paypalSuccessUrl =
      'payment-paypal-subscription-return-success'; // ?subscription_id=
  static String paypalFailedUrl = 'payment-paypal-subscription-return-failed';
  static String websiteUrl = 'https://www.minimeal.com/';
  static String playStoreAppUrl =
      'https://play.google.com/store/apps/details?id=com.minimeal.app';
  static String appStoreAppUrl =
      'https://apps.apple.com/us/app/sun-app-rewards/id6447694772';
}
