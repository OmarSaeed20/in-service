part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const String init = '/';
  // static const String choseLanguage = '/chose_language';
// Todo : phone?
  static verifyCodePage(String id, String email) =>
      Get.toNamed(_verifyCodePage(id, email));
  static verifyEmailAddressPage(String email) =>
      Get.toNamed(_verifyEmailAddressPage(email));
  static resetPasswordPage(String email, String code) =>
      Get.toNamed(_resetPasswordPage(email, code));

  static String _verifyCodePage(String id, String email) =>
      '${Routes.verifyCode}?email=$email&id:$id';
  static String _verifyEmailAddressPage(String email) =>
      '${Routes.verifyForgetPass}?email=$email';
  static String _resetPasswordPage(String email, String code) =>
      '${Routes.resetForgetPass}?email=$email&code=$code';
  /*     */

  static const String onBoarding = '/on_boarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String verifyCode = '/verify_code';

  static const String forgotPassword = '/forgot_password';
  static const String verifyForgetPass = '/verify_forgetPass';
  static const String resetForgetPass = '/reset_forgetPass';

  static const String main = '/main';
  static const String vendorDetailsView = '/vendor_details';
  static const String reservationDetails = '/reservation_details';
  static const String mapView = '/map_view';

  static const String changePassword = '/change_password';
  static const String editAccount = '/edit_account';
  static const String aboutUsView = '/about_us';

  // static const String createPost = '/create_post';
  static const String editMyPost = '/edit_post';

  static const String contactUsView = '/contact_us';
  static const String supportView = '/support';


  static const String notifications = '/notifications';
  static const String privacy = '/privacy';
  static const String terms = '/terms';
}
