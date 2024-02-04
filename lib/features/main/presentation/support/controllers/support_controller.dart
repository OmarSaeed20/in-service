import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'support_state.dart';

class SupportController extends GetxController {
  SupportController(/* {required this.getSupportUseCase} */);
  // final GetSupportUseCase getSupportUseCase;

  static SupportController get to => Get.find();

  final Rx<SupportState> state = SupportState(
    scrCtrl: ScrollController(),
    msgCtrl: TextEditingController(),
    
  ).obs;

  sendMessage() {}
}
