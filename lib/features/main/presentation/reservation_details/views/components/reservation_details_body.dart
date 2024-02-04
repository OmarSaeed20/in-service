import 'package:in_service/features/notifications/presentation/notifications/views/components/notification_model.dart';

import '/index.dart';

class ReservationDetailsCard extends StatelessWidget {
  final NotificationModel notification;
  final int index;
  const ReservationDetailsCard({
    required this.notification,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform: Matrix4.translationValues(Get.width, 0, 0),
      child: Card(
        elevation: 2,
        shape: ContinuousRectangleBorder(borderRadius: 30.radius),
        child: ClipRRect(
          borderRadius: 20.radius,
          child: Padding(
            padding: gPaddingAll(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 55.h,
                      width: 55.w,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                    ),
                    12.sW,
                    Text(
                      "تم الموافقة علي طلبك",
                      style: gStyle14(
                        fontSize: 15,
                        color: isDarkMode(context)
                            ? KColors.white
                            : KColors.textPrimary,
                      ),
                    )
                  ],
                ),
                SvgPicture.asset(Kimage.doneIcon, height: 25.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* 
class ReservationDetailsCard extends GetView<ReservationDetailssControllerImp> {
  const ReservationDetailsCard({super.key, required this.notification});

  final ReservationDetailsData notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: .5, color: KColors.fillBorder),
      ),
      child: ListTile(
        onTap: () {},
        contentPadding: gPaddingSymmetric(horizontal: 16),
        dense: true,
        leading: Container(
            height: 42.h,
            width: 42.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: .3.w, color: KColors.fillBorder),
            ),
            child: Icon(getIcon(notification.type), color: KColors.primary)),
        title: Text(notification.content, style: gStyle16()),
      ),
    );
  }
}

ReservationDetailsType checkNotifcationType(String notificationType) =>
    switch (notificationType) {
      'message' => ReservationDetailsType.message,
      _ => ReservationDetailsType.welcome,
    };
getIcon(String notificationType) =>
    switch (checkNotifcationType(notificationType)) {
      ReservationDetailsType.welcome => Icons.star_border_rounded,
      _ => Icons.notifications_active_outlined,
    };
 */
