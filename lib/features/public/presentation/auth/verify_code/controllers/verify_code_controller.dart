import 'dart:async';

import 'verify_code_state.dart';
import '/index.dart';

abstract class VerifyCodeController extends GetxController {
  void onChangedCode({required String value});
  Future<void> verifyEmail();
  Future<void> resendCode();
  void startTimerCountDown();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeControllerImp(
    this._verifyCodeUseCase,
    this._resendCodeUseCase,
    this.prefs,
  );

  final VerifyCodeRegisterUseCase _verifyCodeUseCase;
  final ResendCodeRegisterUseCase _resendCodeUseCase;
  final AppPreferences prefs;

  final Rx<VerifyCodeState> state = VerifyCodeState(
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
          errorAnimationType: state.value.errorAnimationType!
            ..add(ErrorAnimationType.shake),
        ),
      );
      return;
    }
    if (!state.value.formKey!.currentState!.validate()) return;
    state(state.value.copyWith(rx: handleRxLoading()));
    ApiResult<String> result = await _verifyCodeUseCase(
      VerifyParameter(
        code: state.value.code,
        id: UserService.to.currentUser.value?.id ?? int.parse(state.value.id),
      ),
    );

    result.when(
      failure: (failure) => state(state.value.copyWith(
        rx: handleRxError(failure),
        errorAnimationType: state.value.errorAnimationType!
          ..add(ErrorAnimationType.shake),
      )),
      success: (user) {
        state(state.value.copyWith(rx: RequestState.success));
        prefs.onSubmittedLogin;
        Get.offNamedUntil(Routes.main, (route) => false);
      },
    );
  }

  @override
  Future<void> resendCode() async {
    state(state.value.copyWith(rxResendCode: handleRxLoading()));
    ApiResult<String> result = await _resendCodeUseCase(
      IdOnlyParameter(id: UserService.to.currentUser.value!.id),
    );
    result.when(
      success: (result) {
        startTimerCountDown();
        state(state.value.copyWith(rxResendCode: RequestState.success));
      },
      failure: (failure) =>
          state(state.value.copyWith(rxResendCode: handleRxError(failure))),
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
    state.value.formKey?.currentState?.dispose();
    if (Get.parameters.containsKey("id")) {
      state(state.value.copyWith(id: Get.parameters["id"].valide()));
    }
  }
}
