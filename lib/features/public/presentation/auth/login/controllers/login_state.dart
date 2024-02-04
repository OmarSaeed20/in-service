part of 'login_controller.dart';
/* 
@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(null) AuthenticationEntity? user,
    @Default("") String error,
    @Default("") String password,
    @Default("") String phone,
    @Default("") String codeCountry,
    @Default(false) bool isPassword,
    @Default(false) bool isCorrectPhone,
    @Default(null) GlobalKey<FormState>? formKey,
    @Default(CupertinoIcons.eye) IconData suffixIcon,
    @Default(RequestState.none) RequestState rx,
  }) = _LoginState;
} */

class LoginState extends Equatable {
  const LoginState({
    this.phone = "",
    this.codeCountry = "+20",
    this.password = "",
    this.isPassword = true,
    this.isCorrectPhone = false,
    this.suffixIcon = CupertinoIcons.eye,
    this.formKey,
    this.rx = RequestState.none,
  });
  final String phone, codeCountry, password;
  final bool isPassword, isCorrectPhone;
  final IconData suffixIcon;
  final GlobalKey<FormState>? formKey;
  final RequestState rx;

  LoginState copyWith({
    String? phone,
    String? codeCountry,
    String? password,
    bool? isPassword,
    bool? isCorrectPhone,
    IconData? suffixIcon,
    GlobalKey<FormState>? formKey,
    RequestState? rx,
  }) =>
      LoginState(
        phone: phone ?? this.phone,
        codeCountry: codeCountry ?? this.codeCountry,
        password: password ?? this.password,
        isPassword: isPassword ?? this.isPassword,
        isCorrectPhone: isCorrectPhone ?? this.isCorrectPhone,
        suffixIcon: suffixIcon ?? this.suffixIcon,
        formKey: formKey ?? this.formKey,
        rx: rx ?? this.rx,
      );
  @override
  List<Object?> get props => [
        phone,
        codeCountry,
        password,
        isPassword,
        isCorrectPhone,
        suffixIcon,
        formKey,
        rx,
      ];
}
