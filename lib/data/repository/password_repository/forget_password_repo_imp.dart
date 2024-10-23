import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam_app/data/models/password_response/ForgotPasswordResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/repository/password/forget_password_repo.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  AuthOnlineDataSource onlineDataSource;

  ForgetPasswordRepoImpl(this.onlineDataSource);

  @override
  Future<ApiResult<ForgotPasswordResponse>>? forgetPassword(String email) {
    return onlineDataSource.forgetPassword(email);
  }
}
