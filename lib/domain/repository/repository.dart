import '../../data/api/requests.dart';
import '../../data/response/response.dart';
import '../common/ApiResult.dart';
import '../models/models.dart';

abstract class Repository {
  Future<ApiResult<AuthResponse>> registerUser({required UserRequest userRequest});
}
