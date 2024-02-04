// ignore_for_file: deprecated_member_use
part of 'dio.dart';

void _performLogout(Dio dio,AppPreferences preferences) {
  _lock(dio);
  preferences.logout(); // remove token from local storage
  Get.find<UserService>().currentUser.value = null;
  Get.offAllNamed(Routes.login);

  _unLock(dio);
}

void _unLock(Dio dio) => dio
  ..unlock()
  ..clear();

void _lock(Dio dio) => dio.lock();
