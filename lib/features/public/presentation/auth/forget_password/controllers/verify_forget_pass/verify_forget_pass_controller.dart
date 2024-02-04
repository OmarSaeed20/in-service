import 'dart:async';

import 'package:in_service/core/util/utils.dart';

import '/index.dart';
part 'verify_forget_pass_state.dart';

class VerifyEmailControllerImp extends VerifyCodeController {
  final VerifyEmailUseCase verifyEmailUseCase;
  final EmailAddressUseCase resendCodeUseCase;
  VerifyEmailControllerImp(this.resendCodeUseCase, this.verifyEmailUseCase);

  final Rx<VerifyEmailState> state = VerifyEmailState(
    formKey: GlobalKey<FormState>(),
    errorAnimationType: StreamController<ErrorAnimationType>(),
    phone: Get.parameters["email"].valide(),
  ).obs;

  @override
  void onChangedCode({required String value}) =>
      state(state.value.copyWith(code: value));

  @override
  Future<void> verifyEmail() async {
    if (state.value.code.isEmpty || state.value.code.length < 4) {
      state(
        state.value.copyWith(
          errorAnimationType: state.value.errorAnimationType
            ..add(ErrorAnimationType.shake),
        ),
      );
      // return;
    }
    Routes.resetPasswordPage("01125134973", "4452");
    if (!state.value.formKey.currentState!.validate()) {
      return;
    }

    state(state.value.copyWith(rx: handleRxLoading()));

    ApiResult<String> result = await verifyEmailUseCase(
      ForgotPasswordParameter(email: state.value.phone, code: state.value.code),
    );

    result.when(
      failure: (failure) => state(state.value.copyWith(
        rx: handleRxError(failure),
        errorAnimationType: state.value.errorAnimationType
          ..add(ErrorAnimationType.shake),
      )),
      success: (user) {
        state(state.value.copyWith(rx: RequestState.success));
        Utils.showVerfiySuc();
        Routes.resetPasswordPage(state.value.phone, state.value.code);
      },
    );
  }

  @override
  Future<void> resendCode() async {
    state(state.value.copyWith(rxResendCode: handleRxLoading()));
    ApiResult<String> result = await resendCodeUseCase(
      ForgotPasswordParameter(email: state.value.phone),
    );
    result.when(
      failure: (failure) => state(
        state.value.copyWith(rxResendCode: handleRxError(failure)),
      ),
      success: (result) {
        startTimerCountDown();
        state(state.value.copyWith(rxResendCode: RequestState.success));
      },
    );
  }

  @override
  void startTimerCountDown() {
    state(state.value.copyWith(timeCounter: 60));
    const oneSeconds = Duration(seconds: 1);
    state(
      state.value.copyWith(
        timer: Timer.periodic(
          oneSeconds,
          (Timer timer) => switch (state.value.timeCounter) {
            0 => timer.cancel(),
            _ => state(
                state.value.copyWith(timeCounter: state.value.timeCounter - 1),
              ),
          },
        ),
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    startTimerCountDown();
  }

  @override
  void dispose() {
    super.dispose();
    if (state.value.timer?.isActive == true) state.value.timer?.cancel();
    // ignore: invalid_use_of_protected_member
    state.value.formKey.currentState?.dispose();
  }
}
