import '/index.dart';

class VerifyCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyCodeControllerImp>(
      () => VerifyCodeControllerImp(
        Get.find<VerifyCodeRegisterUseCase>(),
        Get.find<ResendCodeRegisterUseCase>(),
        Get.find<AppPreferences>(),
      ),
      fenix: true,
    );
  }
}
