import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/models/password_response/VerifyResetCodeResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/repository/password/verify_reset_code_repo.dart';

@injectable
class VerifyCodeUseCase {
  VerifyResetCodeRepository verifyResetCodeRepository;
  VerifyCodeUseCase(this.verifyResetCodeRepository);

  Future<ApiResult<VerifyResetCodeResponse>>? invoke(String resetCode) {
    return verifyResetCodeRepository.verifyResetCode(resetCode);
  }
}
