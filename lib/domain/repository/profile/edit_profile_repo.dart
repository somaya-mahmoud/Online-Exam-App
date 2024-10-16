import 'package:online_exam_app/data/models/profile_response/EditProfileResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';

abstract class EditProfileRepo {
  Future<Result<EditProfileResponse>>? editProfile(
      String userName,
      String firstName,
      String lastName,
      String email,
      String password,
      String phone) {}
}
