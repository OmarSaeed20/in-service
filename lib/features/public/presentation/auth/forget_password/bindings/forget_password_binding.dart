import '/index.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordControllerImp>(
      () => ForgetPasswordControllerImp(
        emailAddressUseCase: Get.find<EmailAddressUseCase>(),
      ),
      fenix: true,
    );
  }
}
