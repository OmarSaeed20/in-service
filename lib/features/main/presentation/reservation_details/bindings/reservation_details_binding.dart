import '../controllers/reservation_details_controller.dart';
import '/index.dart';

class ReservationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservationDetailsControllerImp>(
      () => ReservationDetailsControllerImp(),
      fenix: true,
    );
  }
}
