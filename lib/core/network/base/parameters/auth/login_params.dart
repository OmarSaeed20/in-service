import 'package:in_service/index.dart';

class LoginParameter extends Equatable {
  final String email, password;

  const LoginParameter({required this.email, required this.password});
  Map<String, dynamic> toJson() => {'email': email, 'password': password};

  @override
  List<Object> get props => [email, password];
}
