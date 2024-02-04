import '/index.dart';
part 'login_state.dart';

abstract class LoginController extends GetxController {
  Rx<LoginState> state = LoginState(
    formKey: GlobalKey<FormState>(),
  ).obs;

  void toggleObscure();
  void onChangedPassword({required String value});
  void onChangedPhone({String? phone, String? codeCountry});
  void isCheckPhoneValidOrNot({required bool value});
  Future<void> login();
}

class LoginControllerImp extends LoginController {
  LoginControllerImp({
    required this.loginUseCase,
    required this.anonymousUseCase,
    required this.prefs,
  });
  final LoginUseCase loginUseCase;
  final LoginAnonymousUseCase anonymousUseCase;
  final AppPreferences prefs;
  @override
  void toggleObscure() => state(
        state.value.copyWith(
          isPassword: !state.value.isPassword,
          suffixIcon: state.value.isPassword
              ? CupertinoIcons.eye
              : CupertinoIcons.eye_slash,
        ),
      );

  @override
  void onChangedPhone({String? phone, String? codeCountry}) =>
      state(state.value.copyWith(phone: phone, codeCountry: codeCountry));

  @override
  void onChangedPassword({required String value}) =>
      state(state.value.copyWith(password: value));

  @override
  void isCheckPhoneValidOrNot({required bool value}) =>
      state(state.value.copyWith(isCorrectPhone: value));

  @override
  Future<void> login() async {
    if (!state.value.formKey!.currentState!.validate()) return;

    state(state.value.copyWith(rx: handleRxLoading()));
    ApiResult<AuthenticationModel> result = await loginUseCase(
      LoginParameter(
        email: state.value.phone,
        password: state.value.password,
      ),
    );

    result.when(
      success: (user) async {
        UserService.to.currentUser.value = user;
        state(state.value.copyWith(rx: RequestState.success));
        if (user.isVerified == false) {
          ToastManager().showSnak("قم بتاكيد حسابك اولا", isSuc: false);
          Get.toNamed(
              Routes.verifyCodePage(user.id.toString(), state.value.phone));
        } else {
          prefs.onSubmittedLogin;
          Get.offAllNamed(Routes.main);
        }
      },
      failure: (e) => state(state.value.copyWith(rx: handleRxError(e))),
    );
  }

  /* @override
  void onInit() {
    super.onInit();
    _getToken();
  } */

  @override
  void dispose() {
    super.dispose();
    // ignore: invalid_use_of_protected_member
    state.value.formKey!.currentState?.dispose();
  }
}
