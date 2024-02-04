import 'dart:async';
import '/index.dart';

class VerifyCodeState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final String code, phone, id;
  final RequestState rx, rxResendCode;
  final Timer? timer;
  final int timeCounter;
  final StreamController<ErrorAnimationType>? errorAnimationType;

  const VerifyCodeState({
    this.formKey,
    this.id = '',
    this.code = '',
    this.phone = '',
    this.rx = RequestState.none,
    this.rxResendCode = RequestState.none,
    this.timeCounter = 60,
    this.timer,
    this.errorAnimationType,
  });

  VerifyCodeState copyWith({
    GlobalKey<FormState>? formKey,
    String? code,
    String? phone,
    String? id,
    RequestState? rx,
    RequestState? rxResendCode,
    Timer? timer,
    int? timeCounter,
    StreamController<ErrorAnimationType>? errorAnimationType,
  }) =>
      VerifyCodeState(
        formKey: formKey ?? this.formKey,
        id: id ?? this.id,
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
        id,
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
