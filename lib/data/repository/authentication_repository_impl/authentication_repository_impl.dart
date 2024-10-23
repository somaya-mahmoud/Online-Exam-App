import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/network/requests.dart';
import 'package:online_exam_app/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam_app/data/models/login_response/LoginResponse.dart';
import 'package:online_exam_app/data/response/response.dart';
import '../../../domain/common/ApiResult.dart';
import '../../../domain/models/models.dart';
import '../../../domain/repository/auth_repository/authentication_repository.dart';
import '../../data_source/cache_data_source/cache_data_source.dart';
import '../../services/user_manager.dart';

@Injectable(as: AuthenticationRepository)
class RepositoryImpl implements AuthenticationRepository {
  final AuthOnlineDataSource onlineDataSource;

  // final AppCacheDataSource _cacheDataSource;
  // final UserManager _userManager;
  RepositoryImpl(
      this.onlineDataSource,
      // this._cacheDataSource, this._userManager

      );

  @override
  Future<ApiResult<AuthResponse>> registerUser(
      {required UserRequest userRequest})async {
    return onlineDataSource.registerUser(userRequest: userRequest);
    // _userManager.setCurrentUser = user as User;
    // await _cacheDataSource.saveToken();
  }

  @override
  Future<ApiResult<LoginResponse>> loginUser(
      {required String email, required String password})async {
    return onlineDataSource.loginUser(email: email, password: password);
    // _userManager.setCurrentUser = user as User;
    // await _cacheDataSource.saveToken();
    // return user;
  }
}
