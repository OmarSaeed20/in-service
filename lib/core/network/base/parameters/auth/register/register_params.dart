import 'package:in_service/index.dart';

class RegisterParameter extends Equatable {
  final String username, email, password1, password2, phone;

  const RegisterParameter({
    required this.username,
    required this.email,
    required this.password1,
    required this.password2,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'phone_number': phone,
        'email': email,
        'password1': password1,
        'password2': password2,
      };

  @override
  List<Object> get props => [username, email, password1, password2, phone];
}
