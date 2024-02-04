import 'package:in_service/core/widget/handling_view_widgets/list_empty_card.dart';
import 'package:in_service/features/main/presentation/home/views/widget/drawer/custom_drawer.dart';
import 'package:in_service/features/main/presentation/home/views/widget/home_appbar.dart';
import 'package:in_service/features/main/presentation/reservations/controllers/reservations_controller.dart';

import '/index.dart';
import 'components/reservations_card.dart';

class ReservationsView extends GetView<ReservationsControllerImp> {
  const ReservationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBaar(),
      backgroundColor: KColors.scaffoldBackground2,
      drawer: const CustomDrawer(),
      body: Obx(
        () => HandlingRequstView(
          controller.state.value.rx,
          padding: gPadding(bottom: 60),
          image: Kimage.reservations,
          title: 'No Reservations!',
          sub: 'You dont have any reservations yet. Please place order',
          onTap: () {},
          // loading: LoadingViewNotification(controller: controller),
          // onTap: () => controller.getAllNotifications(),
          child: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      padding: gPaddingSymmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: gPadding(top: 6),
            decoration: BoxDecoration(
              color: isDarkMode(context)
                  ? KColors.kDarkSurfaceColor
                  : KColors.white,
              borderRadius: 10.radius,
            ),
            child: [1, 2, 3, 4].isEmpty
                ? ListEmptyCard(
                    icon: Kimage.reservations,
                    title: 'No Reservations!',
                    subtitle:
                        'You dont have any reservations yet. Please place order',
                    onTap: () {},
                  )
                : AnimationLimiter(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => 4.sH,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ReservationsCard(index: index);
                      },
                      // separatorBuilder: (context, index) => const Divider(),
                      itemCount: 12,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

/* class LoadingViewNotification extends StatelessWidget {
  const LoadingViewNotification({super.key, required this.controller});
  final ReservationsControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        controller: controller.state.value.scrCtrl,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.state.value.rx.isLoading
            ? 25
            : controller.state.value.notifications.length,
        itemBuilder: (context, i) => AnimationListWidget(
          index: i,
          milliseconds: 350,
          // horizontal: 25,
          vertical: 30,
          child: controller.state.value.rx.isLoading
              ? const _LaodingBody()
              : NotificationCard(
                  notification: controller.state.value.notifications[i],
                ),
        ),
      ),
    );
  }
}

class _LaodingBody extends StatelessWidget {
  const _LaodingBody();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: BeveledRectangleBorder(
        side: BorderSide(color: KColors.fillBorder, width: .3.w),
      ),
      isThreeLine: false,
      leading: ShimmerWidget(
        child: Container(
          height: 42.h,
          width: 42.h,
          decoration: const BoxDecoration(
            color: KColors.fillColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
      title: Padding(
        padding: gPadding(top: 10),
        child: ShimmerWidget(
          child:
              Container(height: 8.4.h, width: 100.w, color: KColors.fillColor),
        ),
      ),
    );
  }
}
 */