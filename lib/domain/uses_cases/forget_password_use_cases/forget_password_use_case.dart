import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/models/password_response/ForgotPasswordResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/repository/password/forget_password_repo.dart';

@injectable
class ForgetPasswordUseCase {
  ForgetPasswordRepo forgetPasswordRepo;
  ForgetPasswordUseCase(this.forgetPasswordRepo);

  Future<Result<ForgotPasswordResponse>>? invoke(String email) {
    return forgetPasswordRepo.forgetPassword(email);
  }
}
