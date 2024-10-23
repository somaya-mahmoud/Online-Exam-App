

import '../../../domain/common/ApiResult.dart';
import '../../network/requests.dart';
import '../../models/login_response/LoginResponse.dart';
import '../../models/password_response/ForgotPasswordResponse.dart';
import '../../models/password_response/ResetPasswordResponse.dart';
import '../../models/password_response/VerifyResetCodeResponse.dart';
import '../../models/profile_response/EditProfileResponse.dart';
import '../../response/response.dart';

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

  Future<ApiResult<LoginResponse>> loginUser({required String email,required String password});


}
