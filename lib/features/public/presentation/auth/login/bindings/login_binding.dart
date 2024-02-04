
import '/index.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginControllerImp(
        anonymousUseCase: Get.find<LoginAnonymousUseCase>(),
        loginUseCase: Get.find<LoginUseCase>(),
        prefs: Get.find<AppPreferences>(),
      ),
      fenix: true,
    );
  }
}
