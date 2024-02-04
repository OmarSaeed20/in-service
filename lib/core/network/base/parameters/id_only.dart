import '/index.dart';

class IdOnlyParameter extends Equatable {
  final int id;
  const IdOnlyParameter({required this.id});
  Map<String, dynamic> toJson() => {'id': id};
  @override
  List<Object> get props => [id];
}

class StringOnlyParameter extends Equatable {
  final String inputData;
  const StringOnlyParameter({required this.inputData});
  @override
  List<Object> get props => [inputData];
}

class TokenEntity extends Equatable {
  final String token;
  const TokenEntity({required this.token});
  @override
  List<Object> get props => [token];
}

class TokenModel extends TokenEntity {
  const TokenModel({required super.token});
  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      TokenModel(token: json["access"]);
  Map<String, dynamic> toJson() => {'access': token};
}

class TokenVerifyEntity extends Equatable {
  final Map<String, dynamic> map;
  const TokenVerifyEntity({required this.map});
  @override
  List<Object> get props => [map];
}

class TokenVerifyModel extends TokenVerifyEntity {
  const TokenVerifyModel({required super.map});
  factory TokenVerifyModel.fromJson(Map<String, dynamic> json) =>
      TokenVerifyModel(map: json);
}
