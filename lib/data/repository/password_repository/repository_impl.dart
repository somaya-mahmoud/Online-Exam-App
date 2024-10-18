import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/requests.dart';
import 'package:online_exam_app/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam_app/data/response/response.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import '../../../domain/models/models.dart';
import '../../../domain/repository/repository.dart';


@Injectable(as: Repository)
class RepositoryImpl implements Repository {
  final AuthOnlineDataSource onlineDataSource;

  RepositoryImpl(this.onlineDataSource);

  @override
  Future<ApiResult<AuthResponse>> registerUser({required UserRequest userRequest}) {
    return onlineDataSource.registerUser(userRequest: userRequest);
  }
}
