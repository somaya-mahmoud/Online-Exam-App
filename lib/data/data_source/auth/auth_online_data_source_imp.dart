import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api_excute.dart';
import 'package:online_exam_app/data/api/api_manager.dart';
import 'package:online_exam_app/data/api/requests.dart';
import 'package:online_exam_app/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam_app/data/models/password_response/ForgotPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/ResetPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/VerifyResetCodeResponse.dart';
import 'package:online_exam_app/data/models/profile_response/EditProfileResponse.dart';

import 'package:online_exam_app/domain/common/ApiResult.dart';

import '../../response/response.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  late final ApiManager apiManager;
  AuthOnlineDataSourceImpl(this.apiManager);
  @override
  Future<ApiResult<ForgotPasswordResponse>> forgetPassword(String email) {
    return executeApi<ForgotPasswordResponse>(() async {
      return await apiManager.forgetPassword(email);
    });
  }

  @override
  Future<ApiResult<VerifyResetCodeResponse>>? verifyResetCode(
      String resetCode) {
    return executeApi<VerifyResetCodeResponse>(() async {
      return await apiManager.verifyResetCode(resetCode);
    });
  }

  @override
  Future<ApiResult<ResetPasswordResponse>>? resetPassword(
      String email, String newPassword) {
    return executeApi<ResetPasswordResponse>(() async {
      return await apiManager.resetPassword(email, newPassword);
    });
  }

  @override
  Future<ApiResult<AuthResponse>> registerUser(
      {required UserRequest userRequest}) {
    return executeApi<AuthResponse>(() async {
      return await apiManager.registerUser(userRequest: userRequest);
    });
  }

  @override
  Future<ApiResult<EditProfileResponse>>? editProfile(
      String userName,
      String firstName,
      String lastName,
      String email,
      String password,
      String phone) {
    return executeApi<EditProfileResponse>(() async {
      return await apiManager.editProfile(
          userName, firstName, lastName, email, password, phone);
    });
  }
}
