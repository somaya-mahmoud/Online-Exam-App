import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api_excute.dart';
import 'package:online_exam_app/data/api/api_manager.dart';
import 'package:online_exam_app/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam_app/data/models/password_response/ForgotPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/ResetPasswordResponse.dart';
import 'package:online_exam_app/data/models/password_response/VerifyResetCodeResponse.dart';
import 'package:online_exam_app/data/models/profile_response/EditProfileResponse.dart';

import 'package:online_exam_app/domain/common/ApiResult.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  late final ApiManager apiManager;
  AuthOnlineDataSourceImpl(this.apiManager);
  @override
  Future<Result<ForgotPasswordResponse>> forgetPassword(String email) {
    return excuteApi<ForgotPasswordResponse>(() async {
      return await apiManager.forgetPassword(email);
    });
  }

  @override
  Future<Result<VerifyResetCodeResponse>>? verifyResetCode(String resetCode) {
    return excuteApi<VerifyResetCodeResponse>(() async {
      return await apiManager.verifyResetCode(resetCode);
    });
  }

  @override
  Future<Result<ResetPasswordResponse>>? resetPassword(
      String email, String newPassword) {
    return excuteApi<ResetPasswordResponse>(() async {
      return await apiManager.resetPassword(email, newPassword);
    });
  }

  @override
  Future<Result<EditProfileResponse>>? editProfile(
      String userName,
      String firstName,
      String lastName,
      String email,
      String password,
      String phone) {
    return excuteApi<EditProfileResponse>(() async {
      return await apiManager.editProfile(
          userName, firstName, lastName, email, password, phone);
    });
  }
}
