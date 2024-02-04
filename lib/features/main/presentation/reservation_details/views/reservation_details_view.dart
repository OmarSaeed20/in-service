import 'package:in_service/core/widget/dialogs/rating_dialog.dart';
import 'package:in_service/core/widget/dialogs/reservation_confirmed_dialog.dart';
import 'package:in_service/features/main/presentation/home/views/home_view.dart';

import '../controllers/reservation_details_controller.dart';
import '/index.dart';

import 'components/reservation_duration.dart';
import 'components/select_images_card.dart';

class ReservationDetailsView extends StatelessWidget {
  const ReservationDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(title: Kstrings.reservationDetailes.tr),
      backgroundColor: KColors.scaffoldBackground2,
      body: const _Body(),
    );
  }
}

class _Body extends GetView<ReservationDetailsControllerImp> {
  const _Body();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: gPaddingSymmetric(horizontal: 25),
      child: Obx(
        () => Column(
          children: [
            ReservationDuration(controller: controller),
            20.sH,
            SelectImagesCard(
              title: Kstrings.addImage1.tr,
              image: controller.state.value.image?.value,
              isError: controller.state.value.isImageEmpty,
              selectCallback: () => controller.onSelectedImage(),
              cancelCallback: () => controller.removeSelectedImage(),
            ),
            SelectAddress(controller: controller),
          ],
        ),
      ),
    );
  }
}

class SelectAddress extends StatelessWidget {
  const SelectAddress({super.key, required this.controller});
  final ReservationDetailsControllerImp controller;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleRowWidget(title: Kstrings.address.tr),
        Card(
          margin: gPadding(),
          elevation: 0,
          color: isDarkMode(context) ? KColors.kContentColor : KColors.white,
          surfaceTintColor:
              isDarkMode(context) ? KColors.kContentColor : KColors.white,
          child: Padding(
            padding: gPadding(top: 16, right: 10, bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(Kstrings.zipCode.tr,
                              style: gStyle10(color: KColors.textColor)),
                          8.sW,
                          const Expanded(
                            child: TextInputWidget(
                              radius: 10,
                              fillColor: Color(0xFFF5F5F5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    12.sW,
                    Expanded(
                      child: Row(
                        children: [
                          Text(Kstrings.buildingNumber.tr,
                              style: gStyle10(color: KColors.textColor)),
                          8.sW,
                          const Expanded(
                            child: TextInputWidget(
                              radius: 10,
                              fillColor: Color(0xFFF5F5F5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                10.sH,
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(Kstrings.streetNumber.tr,
                              style: gStyle10(color: KColors.textColor)),
                          8.sW,
                          const Expanded(
                            child: TextInputWidget(
                              radius: 10,
                              fillColor: Color(0xFFF5F5F5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    12.sW,
                    Expanded(
                      child: Row(
                        children: [
                          Text(Kstrings.unitNumber.tr,
                              style: gStyle10(color: KColors.textColor)),
                          8.sW,
                          const Expanded(
                            child: TextInputWidget(
                              radius: 10,
                              fillColor: Color(0xFFF5F5F5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        TitleRowWidget(title: Kstrings.selectYourLocation.tr),
        TextInputWidget(
          border: InputBorder.none,
          hintText: Kstrings.yourLocationOnTheMap.tr,
          hintStyle: gStyle10(color: KColors.textGrayLight4),
        ),
        15.sH,
        BtnWidget(
          height: 50,
          onTap: () => Get.toNamed(Routes.mapView),
          title: Kstrings.selectFromMap.tr,
          radius: 10,
        ),
        55.sH,
        BtnWidget(
          height: 50,
          onTap: () => showGeneralDialog(
            barrierColor: Colors.black.withOpacity(0.5),
            transitionBuilder: (context, a1, a2, widget) =>
                ReservationConfirmedDialog(opacity: a1, scale: a1),
            transitionDuration: const Duration(milliseconds: 200),
            barrierDismissible: true,
            barrierLabel: '',
            context: context,
            pageBuilder: (context, a1, a2) => const SizedBox.shrink(),
          ).then((_) => Get.back()),
          title: Kstrings.reservationConfirmation.tr,
          backgroundColor: KColors.green,
        ),
        35.sH,
      ],
    );
  }
}
