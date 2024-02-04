import 'package:in_service/features/notifications/domain/entities/notification_entity.dart';

import '/index.dart';

class VendorDetailsState extends Equatable {
  const VendorDetailsState({
    this.rx = RequestState.none,
    this.notifications = const [],
    this.currentPage = 1,
    this.meta,
    this.countUnread = 0,
  });

  final List<NotificationData> notifications;
  final MetaDataModel? meta;
  final int currentPage, countUnread;
  final RequestState rx;

  VendorDetailsState copyWith({
    List<NotificationData>? notifications = const [],
    MetaDataModel? meta,
    int? currentPage,
    int? countUnread,
    RequestState? rx,
  }) =>
      VendorDetailsState(
        meta: meta ?? this.meta,
        notifications: notifications ?? this.notifications,
        countUnread: countUnread ?? this.countUnread,
        currentPage: currentPage ?? this.currentPage,
        rx: rx ?? this.rx,
      );

  @override
  List<Object?> get props =>
      [notifications, countUnread, rx, currentPage, meta];
}
