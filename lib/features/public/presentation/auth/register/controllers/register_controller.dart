import '/index.dart';
import 'register_state.dart';

abstract class RegisterController extends GetxController {
  void toggleObscure();
  void toggleObscureConfirm();
  void onChangedUsername({required String value});
  void onChangedPhone({String? phone, String? codeCountry});
  void onChangedEmail({required String value});
  void onChangedPassword({required String value});
  void onChangedPasswordConfirm({required String value});
  void isCheckPhoneValidOrNot({required bool value});
}

class RegisterControllerImp extends RegisterController {
  RegisterUseCase registerUseCase;

  RegisterControllerImp({required this.registerUseCase, required this.prefs});
  final AppPreferences prefs;
  final Rx<RegisterState> state =
      RegisterState(formKey: GlobalKey<FormState>()).obs;

  @override
  void onChangedUsername({required String value}) =>
      state(state.value.copyWith(username: value));

  @override
  void onChangedPhone({String? phone, String? codeCountry}) =>
      state(state.value.copyWith(phone: phone, codeCountry: codeCountry));

  @override
  void onChangedEmail({required String value}) =>
      state(state.value.copyWith(email: value));

  @override
  void onChangedPassword({required String value}) =>
      state(state.value.copyWith(password: value));

  @override
  void onChangedPasswordConfirm({required String value}) =>
      state(state.value.copyWith(passwordConfirm: value));

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
  void toggleObscureConfirm() => state(
        state.value.copyWith(
          isPasswordConfirm: !state.value.isPasswordConfirm,
          suffixIconConfirm: state.value.isPasswordConfirm
              ? CupertinoIcons.eye
              : CupertinoIcons.eye_slash,
        ),
      );
  @override
  void isCheckPhoneValidOrNot({required bool value}) =>
      state(state.value.copyWith(isCorrectPhone: value));

  void register() async {
    if (!state.value.formKey.currentState!.validate()) return;

    state(state.value.copyWith(rx: handleRxLoading()));

    ApiResult<AuthenticationModel> loginResult = await registerUseCase(
      RegisterParameter(
        username: state.value.username,
        email: state.value.email,
        phone: state.value.phone,
        password1: state.value.password,
        password2: state.value.passwordConfirm,
      ),
    );

    loginResult.when(
      failure: (e) => state(state.value.copyWith(rx: handleRxError(e))),
      success: (user) async {
        UserService.to.currentUser.value = user;
        state(state.value.copyWith(rx: RequestState.success));
        Routes.verifyCodePage(user.id.toString(), user.email);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    // ignore: invalid_use_of_protected_member
    state.value.formKey.currentState?.dispose();
  }
}
