import 'package:in_service/features/notifications/presentation/notifications/views/components/notification_model.dart';

import '/index.dart';

class NotificationCard extends StatefulWidget {
  final NotificationModel notification;
  final int index;
  const NotificationCard({
    required this.notification,
    required this.index,
    super.key,
  });

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool startAnimation = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (widget.index * 200)),
      transform:
          Matrix4.translationValues(startAnimation ? 0 : Get.width, 0, 0),
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.notification.type ==
                                  NotificationType.orderPaid
                              ? KColors.kAccent1
                              : widget.notification.type ==
                                      NotificationType.orderBooked
                                  ? KColors.kAccent2
                                  : widget.notification.type ==
                                          NotificationType.orderDone
                                      ? KColors.kAccent4
                                      : widget.notification.type ==
                                              NotificationType.orderTime
                                          ? KColors.secondary
                                          : KColors.kAccent7,
                        ),
                        child: SvgPicture.asset(
                          Kimage.notificationIcon,
                          color: KColors.textColor11,
                          // fit: BoxFit.cover,
                        )
                        /* SvgPicture.asset(
                        widget.notification.type == NotificationType.orderPaid
                            ? AppAssets.kPaid
                            : widget.notification.type == NotificationType.orderBooked
                                ? AppAssets.kBooked
                                : widget.notification.type == NotificationType.orderDone
                                    ? AppAssets.kOrderDone
                                    : widget.notification.type ==
                                            NotificationType.orderTime
                                        ? AppAssets.kBookedService
                                        : AppAssets.kOrderCancel, 
                      ),
                                        */
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
class NotificationCard extends GetView<NotificationsControllerImp> {
  const NotificationCard({super.key, required this.notification});

  final NotificationData notification;

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

NotificationType checkNotifcationType(String notificationType) =>
    switch (notificationType) {
      'message' => NotificationType.message,
      _ => NotificationType.welcome,
    };
getIcon(String notificationType) =>
    switch (checkNotifcationType(notificationType)) {
      NotificationType.welcome => Icons.star_border_rounded,
      _ => Icons.notifications_active_outlined,
    };
 */
