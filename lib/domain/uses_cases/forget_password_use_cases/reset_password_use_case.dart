import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/models/password_response/ResetPasswordResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/repository/password/reset_password_repo.dart';

@injectable
class ResetPasswordUseCase {
  ResetPasswordRepo resetPasswordRepo;

  ResetPasswordUseCase(this.resetPasswordRepo);

  Future<ApiResult<ResetPasswordResponse>>? invoke(
      String email, String newPassword) {
    return resetPasswordRepo.resetPassword(email, newPassword);
  }
}
