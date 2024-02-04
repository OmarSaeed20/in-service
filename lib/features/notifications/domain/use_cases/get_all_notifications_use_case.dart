import 'package:in_service/features/notifications/data/models/notification_model.dart';
import 'package:in_service/features/notifications/data/repositories/notification_repo_imp.dart';

import '/index.dart';

class GetNotificationUseCase
    extends UseCaseWithParams<NotificationModel, PageOnlyParameter> {
  final NotificationRepositoryImp _repo;

  GetNotificationUseCase(this._repo);
  @override
  ResultFuture<NotificationModel> call(PageOnlyParameter params) =>
      _repo.getNotification(params);
}
