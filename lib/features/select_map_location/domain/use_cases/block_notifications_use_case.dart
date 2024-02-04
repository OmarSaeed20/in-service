import 'package:in_service/features/notifications/data/repositories/notification_repo_imp.dart';

import '/index.dart';

class BlockNotificationUseCase
    extends UseCaseWithoutParams<AuthenticationModel> {
  final NotificationRepositoryImp _repo;

  BlockNotificationUseCase(this._repo);
  @override
  ResultFuture<AuthenticationModel> call() => _repo.blockNotification();
}
