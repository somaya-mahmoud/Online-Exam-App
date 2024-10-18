import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';


@JsonSerializable()
class UserDto {
  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'firstName')
  String firstName;

  @JsonKey(name: 'lastName')
  String lastName;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'rePassword')
  String rePassword;

  @JsonKey(name: 'phone')
  String phone;

  UserDto({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone ,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}


class AuthResponse {
  AuthResponse({
    this.message,
    this.token,});

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }
  String? message;
  String? token;

}