import 'package:online_exam_app/data/models/password_response/ForgotPasswordResponse.dart';
import 'package:online_exam_app/data/api/requests.dart';
import 'package:online_exam_app/data/models/password_response/ResetPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/VerifyResetCodeResponse.dart';
import 'package:online_exam_app/data/models/profile_response/EditProfileResponse.dart';
import 'package:online_exam_app/data/response/response.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';

abstract class AuthOnlineDataSource {
  Future<ApiResult<ForgotPasswordResponse>>? forgetPassword(String email) {}
  Future<ApiResult<VerifyResetCodeResponse>>? verifyResetCode(String resetCode) {}
  Future<ApiResult<ResetPasswordResponse>>? resetPassword(
      String email, String newPassword) {}
  Future<ApiResult<EditProfileResponse>>? editProfile(
      String userName,
      String firstName,
      String lastName,
      String email,
      String password,
      String phone) {}

  Future<ApiResult<AuthResponse>> registerUser({required UserRequest userRequest});
}
