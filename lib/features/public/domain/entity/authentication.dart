import 'package:in_service/index.dart';

class AuthenticationEntity extends Equatable {
  final int id;
  final String  token, username, email;
  final bool? isVerified;
  final int? age, address;
  final String? profilePhoto, gender, phoneNumber;
  const AuthenticationEntity({
    required this.token,
    required this.username,
    required this.email,
    required this.id,
    this.isVerified = true,
    this.age,
    this.address,
    this.profilePhoto,
    this.gender,
    this.phoneNumber,
  });

  @override
  String toString() {
    return '''AuthenticationEntity(
access:$token,
username:$username,
email:$email,
id:$id
isVerified:$isVerified
phone_number:$phoneNumber
profilePhoto:$profilePhoto
gender:$gender
age:$age
address:$address
    ) ''';
  }

  @override
  List<Object?> get props => [
        id,
        token,
        phoneNumber,
        username,
        email,
        isVerified,
        age,
        address,
        profilePhoto,
        gender,
      ];
}
