import 'package:in_service/core/service/theme_controller.dart';

import '/index.dart';

class AppPreferences {
  final SharedPreferences _prefs;
  AppPreferences(this._prefs);
  static AppPreferences get to => Get.find<AppPreferences>();

  //*   >>>>>>>>>>>>>>>>>>>> wellcom <<<<<<<<<<<<<<<<<
  //? Onboarding
  Future<bool> get onSubmittedOnboarding async =>
      _prefs.setBool(Keys.onboarding, true);
  bool get getOnboarding => _prefs.getBool(Keys.onboarding) ?? false;

  //*   >>>>>>>>>>>>>>>>>>>> Authentication <<<<<<<<<<<<<<<<<
  //? login
  Future<bool> get onSubmittedAnonymous async =>
      await _prefs.setBool(Keys.anonymous, true);
  bool get isAnonymous => _prefs.getBool(Keys.anonymous) ?? false;

  Future<bool> get onSubmittedLogin async =>
      await _prefs.setBool(Keys.login, true);
  bool get isLogin => _prefs.getBool(Keys.login) ?? false;

  //? logoutc
  Future<void> logout() async {
    await _prefs.remove(Keys.anonymous);
    await _prefs.remove(Keys.login);
    await _prefs.remove(Keys.token);
  }

  //!   >>>>>>>>>>>>>>>>>>>> Tokens <<<<<<<<<<<<<<<<<

/*   Future<bool> setUserId(int userId) async =>
      await _prefs.setInt(Keys.userId, userId);
  int? get getUserId => _prefs.getInt(Keys.userId);

  //? FCM token
  Future<bool> setFCMToken(String fcm) async =>
      await _prefs.setString(Keys.fcmToken, fcm);
  String get getFCMToken => _prefs.getString(Keys.fcmToken).valide();
 */
  //? refresh token
  Future<bool> setToken(String token) async =>
      await _prefs.setString(Keys.token, token);
  String  get getToken => _prefs.getString(Keys.token)??"";

  Future<void> removeTokens() async {
    await _prefs.remove(Keys.token);
  } 
 
  //*   >>>>>>>>>>>>>>>>>>>> language <<<<<<<<<<<<<<<<<

  //? language key
  Future<bool> setLang(String code) async =>
      await _prefs.setString(Keys.languageCode, code);
  String get getLang => _prefs.getString(Keys.languageCode) ?? "ar";

  Future<bool> setTheme(String theme) async =>
      await _prefs.setString(Keys.theme, theme);
  String get getTheme => _prefs.getString(Keys.theme) ?? ThemeOptions.light;
}
