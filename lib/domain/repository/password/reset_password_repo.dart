import 'package:online_exam_app/data/models/password_response/ResetPasswordResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';

abstract class ResetPasswordRepo {
  Future<ApiResult<ResetPasswordResponse>>? resetPassword(
      String email, String newPassword) {

      }
}
