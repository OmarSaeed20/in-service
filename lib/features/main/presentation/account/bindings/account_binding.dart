import 'package:in_service/features/main/domain/use_case/my_account/delete_account_usecase.dart';
import 'package:in_service/features/main/domain/use_case/my_account/logout_usecase.dart';
import 'package:in_service/features/main/presentation/account/controllers/account_controller.dart';

import '/index.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountControllerImp>(
      () => AccountControllerImp(
        deleteAccountUseCase: Get.find<DeleteAccountUseCase>(),
        logOutUseCase: Get.find<LogOutUseCase>(),
      ),
    );
  }
}
