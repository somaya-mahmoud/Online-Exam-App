import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/models/profile_response/EditProfileResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/uses_cases/profile_use_cases/edit_profile_use_case.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileState> {
  EditProfileUseCase editProfileUseCase;
  EditProfileViewModel(this.editProfileUseCase)
      : super(EditProfileInitialState());
  void updateProfile(String userName, String firstName, String lastName,
      String email, String password, String phone) async {
    emit(EditProfileLoadingState());
    var result = await editProfileUseCase.invoke(
        userName, firstName, lastName, email, password, phone);
    switch (result) {
      case null:
      case Success<EditProfileResponse>():
        {
          emit(EditProfileSuccessState());
        }

      case Fail<EditProfileResponse>():
        {
          emit(EditProfileErrorState(result.errorData));
        }
    }
  }
}

sealed class EditProfileState {}

class EditProfileInitialState extends EditProfileState {}

class EditProfileLoadingState extends EditProfileState {}

class EditProfileErrorState extends EditProfileState {
  Exception? exception;
  EditProfileErrorState(this.exception);
}

class EditProfileSuccessState extends EditProfileState {}
