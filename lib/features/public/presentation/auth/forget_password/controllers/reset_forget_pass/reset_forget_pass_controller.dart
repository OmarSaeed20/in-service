import '/index.dart';
import 'reset_forget_pass_state.dart';

abstract class ResetPasswordController extends GetxController {
  void toggleObscure();
  void toggleObscureConfirm();
  void onChangedPassword({required String value});
  void onChangedPasswordConfirm({required String value});
  Future<void> resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordControllerImp({required this.resetPasswordUseCase});

  final Rx<ResetPasswordState> state = ResetPasswordState(
    formKey: GlobalKey<FormState>(),
    email: Get.parameters["email"].valide(),
    code: Get.parameters["code"].valide(),
  ).obs;

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
  Future<void> resetPassword() async {
    if (!state.value.formKey.currentState!.validate()) return;
    state(state.value.copyWith(requestState: handleRxLoading()));

    ApiResult<String> result = await resetPasswordUseCase(
      ForgotPasswordParameter(
        email: state.value.email,
        code: state.value.code,
        password: state.value.password,
      ),
    );

    result.when(
      failure: (failure) =>
          state(state.value.copyWith(requestState: handleRxError(failure))),
      success: (user) {
        state(state.value.copyWith(requestState: RequestState.success));
        // TODO :Translation
        toast("تمت إعادة تعيين كلمة المرور بنجاح");
        Get.offNamedUntil(Routes.login, (route) => false);
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
