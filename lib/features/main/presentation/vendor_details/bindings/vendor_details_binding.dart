import '../controllers/vendor_details_controller.dart';
import '/index.dart';

class VendorDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => VendorDetailsControllerImp(),
      fenix: true,
    );
  }
}
