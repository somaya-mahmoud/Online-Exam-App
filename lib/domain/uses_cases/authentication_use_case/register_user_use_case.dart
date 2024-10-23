import 'package:injectable/injectable.dart';

import '../../../data/network/requests.dart';
import '../../../data/response/response.dart';
import '../../common/ApiResult.dart';
import '../../repository/auth_repository/authentication_repository.dart';


@injectable
class RegisterUseCase {
  final AuthenticationRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<ApiResult<AuthResponse>> call(UserRequest body) async {
    return await _authRepository.registerUser(userRequest: body);
  }
}
