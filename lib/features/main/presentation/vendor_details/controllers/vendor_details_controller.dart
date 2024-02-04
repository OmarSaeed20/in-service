import '/index.dart';

import 'vendor_details_state.dart';

abstract class VendorDetailsController extends GetxController {}

class VendorDetailsControllerImp extends VendorDetailsController {
  VendorDetailsControllerImp();

  static VendorDetailsControllerImp get to =>
      Get.find<VendorDetailsControllerImp>();

  final Rx<VendorDetailsState> state = const VendorDetailsState().obs;
}
