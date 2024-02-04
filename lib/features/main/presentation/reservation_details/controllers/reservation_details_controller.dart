import 'dart:io';

import 'package:in_service/core/widget/dialogs/pick_picture_dialog.dart';

import '/index.dart';

import 'reservation_details_state.dart';

abstract class ReservationDetailsController extends GetxController {
  void setSelectedValue(Object value);
  Future<void> onSelectedImage();
  void removeSelectedImage();
}

class ReservationDetailsControllerImp extends ReservationDetailsController {
  ReservationDetailsControllerImp();

  static ReservationDetailsControllerImp get to => Get.find();

  final Rx<ReservationDetailsState> state =
      ReservationDetailsState(image: null.obs).obs;

  @override
  void setSelectedValue(Object value) {
    state(state.value.copyWith(selectedValue: value as int));
  }

  @override
  Future<void> onSelectedImage() async => await _pickPicture();

  @override
  void removeSelectedImage() => state(state.value.copyWith(image: null.obs));

  _pickPicture() async {
    final ImagePicker picker = ImagePicker();
    await showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) => PickPictureDialog(
        opacity: a1,
        scale: a1,
        camTap: () async {
          Get.back();
          var image = await picker.pickImage(source: ImageSource.camera);
          if (image != null) {
            state(
              state.value
                  .copyWith(image: File(image.path).obs, isImageEmpty: false),
            );
          }
        },
        galTap: () async {
          Get.back();
          var image = await picker.pickImage(source: ImageSource.gallery);
          if (image != null) {
            state(
              state.value
                  .copyWith(image: File(image.path).obs, isImageEmpty: false),
            );
          }
        },
      ),
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: Get.context!,
      pageBuilder: (context, a1, a2) => const SizedBox.shrink(),
    );
  }
}
