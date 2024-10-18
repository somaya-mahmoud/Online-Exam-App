import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam_app/data/models/password_response/ResetPasswordResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/repository/reset_password_repo.dart';

@Injectable(as: ResetPasswordRepo)
class ResetPasswordRepoImpl implements ResetPasswordRepo {
  AuthOnlineDataSource onlineDataSource;
  ResetPasswordRepoImpl(this.onlineDataSource);
  @override
  Future<ApiResult<ResetPasswordResponse>>? resetPassword(
      String email, String newPassword) {
    onlineDataSource.resetPassword(email, newPassword);
  }
}
