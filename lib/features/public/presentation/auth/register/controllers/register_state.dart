import '/index.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.username = "",
    this.phone = "",
    this.codeCountry = "+20",
    this.email = "",
    this.password = "",
    this.passwordConfirm = "",
    this.isPassword = true,
    this.isPasswordConfirm = true,
    this.isCorrectPhone = false,
    this.suffixIcon = CupertinoIcons.eye,
    this.suffixIconConfirm = CupertinoIcons.eye,
    required this.formKey,
    this.rx = RequestState.none,
  });
  final String username, phone, codeCountry, email, password, passwordConfirm;
  final bool isPassword, isPasswordConfirm, isCorrectPhone;
  final IconData suffixIcon, suffixIconConfirm;
  final GlobalKey<FormState> formKey;
  final RequestState rx;

  RegisterState copyWith({
    String? username,
    String? phone,
    String? codeCountry,
    String? email,
    String? password,
    String? passwordConfirm,
    bool? isPassword,
    bool? isPasswordConfirm,
    bool? isCorrectPhone,
    IconData? suffixIcon,
    IconData? suffixIconConfirm,
    GlobalKey<FormState>? formKey,
    RequestState? rx,
  }) =>
      RegisterState(
        username: username ?? this.username,
        phone: phone ?? this.phone,
        isPasswordConfirm: isPasswordConfirm ?? this.isPasswordConfirm,
        codeCountry: codeCountry ?? this.codeCountry,
        email: email ?? this.email,
        password: password ?? this.password,
        passwordConfirm: passwordConfirm ?? this.passwordConfirm,
        isPassword: isPassword ?? this.isPassword,
        suffixIconConfirm: suffixIconConfirm ?? this.suffixIconConfirm,
        isCorrectPhone: isCorrectPhone ?? this.isCorrectPhone,
        suffixIcon: suffixIcon ?? this.suffixIcon,
        formKey: formKey ?? this.formKey,
        rx: rx ?? this.rx,
      );
  @override
  List<Object?> get props => [
        username,
        phone,
        codeCountry,
        email,
        password,
        passwordConfirm,
        isPassword,
        isPasswordConfirm,
        isCorrectPhone,
        suffixIcon,
        suffixIconConfirm,
        formKey,
        rx,
      ];
}
