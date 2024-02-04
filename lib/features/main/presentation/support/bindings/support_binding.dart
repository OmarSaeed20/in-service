import 'package:get/get.dart';
import 'package:in_service/features/main/presentation/support/controllers/support_controller.dart';

class SupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportController>(
      () => SupportController(/* getSupportUseCase: Get.find() */),fenix: true,
    );
  }
}
