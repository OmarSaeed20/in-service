import 'package:in_service/core/service/theme_controller.dart';
import 'package:in_service/features/main/presentation/main/controllers/main_controller.dart';

import '/index.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainControllerImp>(
      () => MainControllerImp(database: Get.find<AppPreferences>()),
      fenix: true,
    );
  }
}

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(
      () => ThemeController(storage: Get.find<AppPreferences>()),
      fenix: true,
    );
  }
}
