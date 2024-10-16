import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/models/password_response/ResetPasswordResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/uses_cases/forget_password_use_cases/reset_password_use_case.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordState> {
  ResetPasswordUseCase resetPasswordUseCase;
  ResetPasswordViewModel(this.resetPasswordUseCase)
      : super(ResetPasswordInitialState());

  void resetPassword(String email, String newPassword) async {
    emit(ResetPasswordLoadingState());
    var result = await resetPasswordUseCase.invoke(email, newPassword);
    switch (result) {
      case null:
      case Success<ResetPasswordResponse>():
        {
          emit(ResetPasswordSuccessState());
        }

      case Fail<ResetPasswordResponse>():
        {
          emit(ResetPasswordErrorState(result.exception));
        }
    }
  }
}

sealed class ResetPasswordState {}

class ResetPasswordInitialState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordErrorState extends ResetPasswordState {
  Exception? exception;
  ResetPasswordErrorState(this.exception);
}

class ResetPasswordSuccessState extends ResetPasswordState {}
