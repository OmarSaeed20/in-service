import 'package:in_service/features/notifications/data/models/notification_model.dart';

import '/index.dart';

abstract class BaseNotificationRepository {
  ResultFuture<NotificationModel> getNotification(PageOnlyParameter parameter);
  ResultFuture<AuthenticationModel> blockNotification();
}
