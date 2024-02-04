import 'package:in_service/core/util/utils.dart';

import '/index.dart';

class AuthenticationModel extends AuthenticationEntity {
  const AuthenticationModel({
    required super.token,
    required super.email,
    required super.id,
    required super.username,
    super.isVerified,
    super.address,
    super.age,
    super.gender,
    super.profilePhoto,
    super.phoneNumber,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    bool isVerified(Map<String, dynamic> json) =>
        switch (json.containsKey("is_verified")) {
          true => json["is_verified"],
          false => true,
        };
    return AuthenticationModel(
      id: Utils.gJsonInt(json, 'id'),
      token: Utils.gJsonString(json, 'token'),
      username: Utils.gJsonString(json, 'username'),
      email: Utils.gJsonString(json, 'email'),
      isVerified: isVerified(json),
      profilePhoto: Utils.gJsonString(json, "profile_photo"),
      age: Utils.gJsonInt(json, "age"),
      address: Utils.gJsonInt(json, "address"),
      gender: Utils.gJsonString(json, "gender"),
      phoneNumber: Utils.gJsonString(json, "phone_number"),
    );
  }
}
