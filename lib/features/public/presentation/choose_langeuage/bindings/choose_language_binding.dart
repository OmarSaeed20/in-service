import '/index.dart';

class ChooseLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ChooseLanguageControllerImp(Get.find<AppPreferences>()),
      fenix: true,
    );
  }
}
