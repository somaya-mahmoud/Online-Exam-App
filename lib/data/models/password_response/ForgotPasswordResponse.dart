/// message : "success"
/// info : "OTP sent to your email"

class ForgotPasswordResponse {
  ForgotPasswordResponse({
      String? message, 
      String? info,}){
    _message = message;
    _info = info;
}

  ForgotPasswordResponse.fromJson(dynamic json) {
    _message = json['message'];
    _info = json['info'];
  }
  String? _message;
  String? _info;
ForgotPasswordResponse copyWith({  String? message,
  String? info,
}) => ForgotPasswordResponse(  message: message ?? _message,
  info: info ?? _info,
);
  String? get message => _message;
  String? get info => _info;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['info'] = _info;
    return map;
  }

}