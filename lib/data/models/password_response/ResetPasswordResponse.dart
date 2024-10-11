/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MDdiNzlhZTc3ZDY4NTk1YTI5MjMwNSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI4NTgwMDg5fQ.PQ1SAbjqzapJTZebQ_OQr4h3Z2mwVBraE8ng6VSVK_I"

class ResetPasswordResponse {
  ResetPasswordResponse({
      String? message, 
      String? token,}){
    _message = message;
    _token = token;
}

  ResetPasswordResponse.fromJson(dynamic json) {
    _message = json['message'];
    _token = json['token'];
  }
  String? _message;
  String? _token;
ResetPasswordResponse copyWith({  String? message,
  String? token,
}) => ResetPasswordResponse(  message: message ?? _message,
  token: token ?? _token,
);
  String? get message => _message;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['token'] = _token;
    return map;
  }

}