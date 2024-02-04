import '/index.dart';

class ForgetPasswordState extends Equatable {
  const ForgetPasswordState({
    this.phone = "",
    this.codeCountry= "+20",
    this.formKey,
    this.rx = RequestState.none,
  });
  final String phone,codeCountry;
  final GlobalKey<FormState>? formKey;
  final RequestState rx;

  ForgetPasswordState copyWith({
    String? phone,
    String? codeCountry,
    GlobalKey<FormState>? formKey,
    RequestState? rx,
  }) =>
      ForgetPasswordState(
        codeCountry: codeCountry ?? this.codeCountry,
        phone: phone ?? this.phone,
        formKey: formKey ?? this.formKey,
        rx: rx ?? this.rx,
      );
  @override
  List<Object?> get props => [
        codeCountry,
        phone,
        formKey,
        rx,
      ];
}
