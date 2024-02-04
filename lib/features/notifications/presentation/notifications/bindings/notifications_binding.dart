import 'package:in_service/features/notifications/domain/use_cases/block_notifications_use_case.dart';
import 'package:in_service/features/notifications/domain/use_cases/get_all_notifications_use_case.dart';
import 'package:in_service/features/notifications/presentation/notifications/controllers/notifications_controller.dart';

import '/index.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsControllerImp>(
      () => NotificationsControllerImp(
        getNotificationUseCase: Get.find<GetNotificationUseCase>(),
        blockNotificationUseCase: Get.find<BlockNotificationUseCase>(),
      ),
      fenix: true,
    );
  }
}
