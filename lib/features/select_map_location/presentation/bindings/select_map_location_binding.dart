import 'package:get/get.dart';
import 'package:in_service/features/select_map_location/presentation/controllers/select_map_location_controller.dart';

class SelectMapLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectMapLocationControllerImp>(
      () => SelectMapLocationControllerImp(/* locationRepo: Get.find() */),
      fenix: true,
    );
  }
}
