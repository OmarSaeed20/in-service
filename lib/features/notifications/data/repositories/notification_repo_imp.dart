import 'package:in_service/features/notifications/data/data_source/remote/notifications_client.dart';
import 'package:in_service/features/notifications/data/models/notification_model.dart';
import 'package:in_service/features/notifications/domain/repositories/base_notification_repository.dart';

import '/index.dart';

class NotificationRepositoryImp implements BaseNotificationRepository {
  NotificationRepositoryImp(this._remoteData, this._preferences);
  final NotificationClient _remoteData;
  final AppPreferences _preferences;

  @override
  ResultFuture<NotificationModel> getNotification(
    PageOnlyParameter parameter,
  ) async =>
      executAndHandelError<NotificationModel>(
        () => _remoteData.notifications(
          page: parameter.page,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );
  @override
  ResultFuture<AuthenticationModel> blockNotification() async =>
      executAndHandelError<AuthenticationModel>(
        () => _remoteData.blockNotification(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

 
}
