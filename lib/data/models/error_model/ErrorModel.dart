
class ErrorModel {
  ErrorModel({
      this.message, 
      this.code, 
      this.stack,});


  String? message;
  int? code;
  String? stack;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    map['stack'] = stack;
    return map;
  }



  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      message: map['message'] as String,
      code: map['code'] as int,
      stack: map['stack'] as String,
    );
  }
}