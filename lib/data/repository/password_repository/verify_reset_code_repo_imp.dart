import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam_app/data/models/password_response/VerifyResetCodeResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/repository/password/verify_reset_code_repo.dart';

@Injectable(as: VerifyResetCodeRepository)
class VerifyResetCodeImpl implements VerifyResetCodeRepository {
  AuthOnlineDataSource onlineDataSource;
  VerifyResetCodeImpl(this.onlineDataSource);
  @override
  Future<Result<VerifyResetCodeResponse>>? verifyResetCode(String resetCode) {
    return onlineDataSource.verifyResetCode(resetCode);
  }
}
