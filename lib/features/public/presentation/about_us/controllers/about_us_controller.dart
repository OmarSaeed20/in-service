import '/index.dart';

abstract class AboutUsController extends GetxController {
  Future<void> getAboutUs();
  RequestState rx = RequestState.loading;
  AboutUsEntity? aboutus;
}

class AboutUsControllerImp extends AboutUsController {
  static AboutUsControllerImp get to => Get.find<AboutUsControllerImp>();
  final GetAboutUsUseCase getAboutAppUseCase;
  AboutUsControllerImp({required this.getAboutAppUseCase});

  // RequestState rx = RequestState.loading;
  // AboutUsEntity? aboutus;

  @override
  Future<void> getAboutUs() async {
    final result = await getAboutAppUseCase();

    result.when(
      success: (result) {
        aboutus = result.data;
        rx = RequestState.success;
        update();
      },
      failure: (e) {
        rx = RequestState.failure;
        update();
        ToastManager().showSnak(
          NetworkExceptions.getErrorMessage(e),
          isSuc: false,
        );
      },
    );
  }

  @override
  void onInit() async {
    await getAboutUs();

    super.onInit();
  }
}
