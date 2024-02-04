import 'package:in_service/core/widget/lists/radio_list_tile_wiget.dart';
import 'package:in_service/features/main/presentation/reservation_details/controllers/reservation_details_controller.dart';
import 'package:in_service/index.dart';

class ReservationDuration extends StatelessWidget {
  const ReservationDuration({super.key, required this.controller});

  final ReservationDetailsControllerImp controller;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: context.width,
      child: Card(
        elevation: 0,
        color: isDarkMode(context) ? KColors.kContentColor : KColors.white,
        surfaceTintColor:
            isDarkMode(context) ? KColors.kContentColor : KColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: 10.radiusCircular,
                bottomLeft: 10.radiusCircular,
              ),
              child: Container(
                constraints: const BoxConstraints(minWidth: 95),
                padding: gPadding(
                  right: 12,
                  bottom: 7,
                  left: 10,
                  top: 9,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: 10.radiusCircular,
                    bottomLeft: 10.radiusCircular,
                  ),
                  color: KColors.primary,
                ),
                child: Text(
                  "المدة",
                  overflow: TextOverflow.ellipsis,
                  style: gStyle12(
                    color: KColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            _TimeBody(controller: controller)
          ],
        ),
      ),
    );
  }
}

class _TimeBody extends StatelessWidget {
  const _TimeBody({required this.controller});

  final ReservationDetailsControllerImp controller;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: RadioListTileWiget(
              title: Kstrings.month.tr,
              vlu: 0,
              groupVlu: controller.state.value.selectedValue,
              onChanged: (value) => controller.setSelectedValue(value!),
            ),
          ),
          Expanded(
            child: RadioListTileWiget(
              title: Kstrings.towMonthes.tr,
              vlu: 1,
              groupVlu: controller.state.value.selectedValue,
              onChanged: (value) => controller.setSelectedValue(value!),
            ),
          ),
        ],
      );
}
