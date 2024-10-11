/// status : "Success"

class VerifyResetCodeResponse {
  VerifyResetCodeResponse({
      String? status,}){
    _status = status;
}

  VerifyResetCodeResponse.fromJson(dynamic json) {
    _status = json['status'];
  }
  String? _status;
VerifyResetCodeResponse copyWith({  String? status,
}) => VerifyResetCodeResponse(  status: status ?? _status,
);
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    return map;
  }

}