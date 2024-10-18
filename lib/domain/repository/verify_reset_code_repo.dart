import 'package:online_exam_app/data/models/password_response/VerifyResetCodeResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';

abstract class VerifyResetCodeRepository {
  Future<ApiResult<VerifyResetCodeResponse>>? verifyResetCode(String resetCode) {}
}
