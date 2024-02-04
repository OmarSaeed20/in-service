import 'package:in_service/index.dart';

class VerifyParameter extends Equatable {
  final int id;
  final String code;

  const VerifyParameter({
    required this.code,
    required this.id,
  });
  Map<String, dynamic> toJson() => {'id': id, "code": code};

  @override
  List<Object> get props => [code, id];
}
