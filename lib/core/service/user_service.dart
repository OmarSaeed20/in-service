import 'dart:async';

import '/index.dart';

class UserService extends GetxService {
  UserService({
    required this.networkInfo,
    required this.pref,
    required this.getUserUseCase,
  });
  final GetUserUseCase getUserUseCase;
  final ConnectionCheckerImpl networkInfo;
  final AppPreferences pref;
  static UserService get to => Get.find<UserService>();

  Rx<AuthenticationEntity?> currentUser = Rx(null);

  Future<UserService> init() async {
    if (await networkInfo.isConnected == true) {
      if ((pref.isLogin || pref.isAnonymous) && currentUser.value == null) {
        await getUser();
      }
    }

    currentUser.listen((value) async {
      if (value != null) {
        await pref.setToken(value.token);
      }
    });
    return this;
  }

  Future<void> getUser() async {
    final result = await getUserUseCase();
    result.when(
      failure: (e) => ToastManager().showSnak(
        NetworkExceptions.getErrorMessage(e),
        isSuc: false,
      ),
      success: (user) async => currentUser.value = user,
    );
  }
}
