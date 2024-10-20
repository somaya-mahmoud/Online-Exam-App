import 'package:online_exam_app/data/models/password_response/ForgotPasswordResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';

abstract class ForgetPasswordRepo {
  Future<ApiResult<ForgotPasswordResponse>>? forgetPassword(String email) {}
}
