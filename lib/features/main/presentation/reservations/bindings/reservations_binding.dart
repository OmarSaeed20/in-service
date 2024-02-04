import 'package:in_service/features/main/presentation/reservations/controllers/reservations_controller.dart';

import '/index.dart';

class ReservationsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<ReservationsControllerImp>(
        () => ReservationsControllerImp(),
        fenix: true,
      );
}
