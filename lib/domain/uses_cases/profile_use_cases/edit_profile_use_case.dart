import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/models/profile_response/EditProfileResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/repository/profile/edit_profile_repo.dart';

@injectable
class EditProfileUseCase {
  EditProfileRepo editProfileRepo;
  EditProfileUseCase(this.editProfileRepo);
  Future<Result<EditProfileResponse>>? invoke(String userName, String firstName,
      String lastName, String email, String password, String phone) {
    return editProfileRepo.editProfile(
        userName, firstName, lastName, email, password, phone);
  }
}
