import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam_app/data/models/profile_response/EditProfileResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/repository/profile/edit_profile_repo.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImp implements EditProfileRepo {
  AuthOnlineDataSource authOnlineDataSource;
  EditProfileRepoImp(this.authOnlineDataSource);
  @override
  Future<Result<EditProfileResponse>>? editProfile(
      String userName,
      String firstName,
      String lastName,
      String email,
      String password,
      String phone) {
    authOnlineDataSource.editProfile(
        userName, firstName, lastName, email, password, phone);
  }
}
