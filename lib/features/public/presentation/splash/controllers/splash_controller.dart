import 'dart:async';

import '/index.dart';

class SplashController extends GetxController {
  final AppPreferences preferences;

  SplashController(this.preferences);
  Future<void> navigate() async =>
      switch (await Get.find<ConnectionCheckerImpl>().isConnected == true) {
        true => switch (preferences.isLogin) {
            true => Get.offAllNamed(Routes.main),
            false => switch (preferences.getOnboarding) {
                true => Get.offAllNamed(Routes.login),
                false => Get.offAllNamed(Routes.onBoarding),
              },
          },
        false => {
            ToastManager().showSnak("No internet connection".tr, isSuc: false),
            UserService.to.currentUser.value = null,
            Get.offAllNamed(Routes.login),
          },
      };

  @override
  void onReady() {
    // Get.offAllNamed(Routes.onBoarding);
    Timer(const Duration(seconds: 2), () async => await navigate());
    super.onReady();
  }
}
