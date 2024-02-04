part of 'verify_forget_pass_controller.dart';

class VerifyEmailState extends Equatable {
  final GlobalKey<FormState> formKey;
  final String code;
  final String phone;
  final RequestState rx;
  final RequestState rxResendCode;
  final Timer? timer;
  final int timeCounter;
  final StreamController<ErrorAnimationType> errorAnimationType;

  const VerifyEmailState({
    required this.formKey,
    this.code = '',
    this.phone = '',
    this.rx = RequestState.none,
    this.rxResendCode = RequestState.none,
    this.timeCounter = 60,
    this.timer,
    required this.errorAnimationType,
  });

  VerifyEmailState copyWith({
    GlobalKey<FormState>? formKey,
    String? code,
    String? phone,
    RequestState? rx,
    RequestState? rxResendCode,
    Timer? timer,
    int? timeCounter,
    StreamController<ErrorAnimationType>? errorAnimationType,
  }) =>
      VerifyEmailState(
        formKey: formKey ?? this.formKey,
        code: code ?? this.code,
        phone: phone ?? this.phone,
        rx: rx ?? this.rx,
        rxResendCode: rxResendCode ?? this.rxResendCode,
        timer: timer ?? this.timer,
        timeCounter: timeCounter ?? this.timeCounter,
        errorAnimationType: errorAnimationType ?? this.errorAnimationType,
      );
  @override
  List<Object?> get props => [
        formKey,
        code,
        phone,
        rx,
        rxResendCode,
        timer,
        timeCounter,
        errorAnimationType,
      ];
}
