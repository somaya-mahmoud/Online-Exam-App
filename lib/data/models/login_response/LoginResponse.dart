import 'User.dart';


class LoginResponse {
  LoginResponse({
      this.message, 
      this.token, 
      this.user,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  String? token;
  User? user;
LoginResponse copyWith({  String? message,
  String? token,
  User? user,
}) => LoginResponse(  message: message ?? this.message,
  token: token ?? this.token,
  user: user ?? this.user,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}