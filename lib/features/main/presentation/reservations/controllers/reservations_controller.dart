import '/index.dart';

import 'reservations_state.dart';

abstract class ReservationsController extends GetxController {}

class ReservationsControllerImp extends ReservationsController {
  ReservationsControllerImp();

  static ReservationsControllerImp get to => Get.find();

  final Rx<ReservationsState> state =
      ReservationsState(scrCtrl: ScrollController()).obs;
}
