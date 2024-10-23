import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/models/login_response/LoginResponse.dart';

import '../../common/ApiResult.dart';
import '../../repository/auth_repository/authentication_repository.dart';


@injectable
class LoginUseCase {
  final AuthenticationRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<ApiResult<LoginResponse>> call({required String email, required String password}) async {
    return await _authRepository.loginUser(email: email,password: password);
  }
}
