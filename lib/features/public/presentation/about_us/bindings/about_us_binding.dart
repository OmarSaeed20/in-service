import '/index.dart';

class AboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutUsControllerImp>(
      () => AboutUsControllerImp(
          getAboutAppUseCase: Get.find<GetAboutUsUseCase>()),
      fenix: true,
    );
  }
}
