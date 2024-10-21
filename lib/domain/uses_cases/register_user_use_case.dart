import 'package:injectable/injectable.dart';

import '../../data/api/requests.dart';
import '../../data/response/response.dart';
import '../common/ApiResult.dart';
import '../repository/repository.dart';


@injectable
class RegisterUseCase {
  Repository authRepository;

  RegisterUseCase(this.authRepository);

  Future<ApiResult<AuthResponse>> call(UserRequest body) async {
    return await authRepository.registerUser(userRequest: body);
  }
}
