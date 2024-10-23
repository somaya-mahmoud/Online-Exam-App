import '../../../data/network/requests.dart';
import '../../../data/models/login_response/LoginResponse.dart';
import '../../../data/response/response.dart';
import '../../common/ApiResult.dart';

abstract class AuthenticationRepository {

  Future<ApiResult<AuthResponse>> registerUser({required UserRequest userRequest});
  Future<ApiResult<LoginResponse>> loginUser({required String email,required String password});
}
