
import 'package:online_exam_app/data/models/password_response/ForgotPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/ResetPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/VerifyResetCodeResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';

abstract class AuthOnlineDataSource {
  Future<Result<ForgotPasswordResponse>>? forgetPassword(String email) {}
  Future<Result<VerifyResetCodeResponse>>? verifyResetCode(String resetCode) {}
  Future<Result<ResetPasswordResponse>>? resetPassword(
      String email, String newPassword) {}
}
