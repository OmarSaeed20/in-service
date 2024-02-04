import '/index.dart';

abstract class ForgetPasswordController extends GetxController {
  void onChangedPhone({String? phone, String? codeCountry});
  Future<void> setEmailAddress();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  ForgetPasswordControllerImp({required this.emailAddressUseCase});
  final EmailAddressUseCase emailAddressUseCase;
  final Rx<ForgetPasswordState> state = const ForgetPasswordState().obs;

  @override
  void onChangedPhone({String? phone, String? codeCountry}) =>
      state(state.value.copyWith(phone: phone, codeCountry: codeCountry));

  @override
  Future<void> setEmailAddress() async {
    if (!state.value.formKey!.currentState!.validate()) {
      return Routes.verifyEmailAddressPage(
          /* state.value.phone */ "01125134973");
    }

    state(state.value.copyWith(rx: handleRxLoading()));

    ApiResult<String> result = await emailAddressUseCase(
      ForgotPasswordParameter(email: state.value.phone),
    );

    result.when(
      failure: (e) => state(state.value.copyWith(rx: handleRxError(e))),
      success: (result) {
        state(state.value.copyWith(rx: RequestState.success));
        Routes.verifyEmailAddressPage(state.value.phone);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    state(state.value.copyWith(formKey: GlobalKey<FormState>()));
  }

  @override
  void dispose() {
    super.dispose();
    // ignore: invalid_use_of_protected_member
    state.value.formKey?.currentState?.dispose();
  }
}
