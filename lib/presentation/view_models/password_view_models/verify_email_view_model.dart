import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/uses_cases/forget_password_use_cases/verify_code_use_case.dart';

@injectable
class VerifyEmailViewModel extends Cubit<VerifyEmailState> {
  VerifyCodeUseCase verifyCodeUseCase;
  VerifyEmailViewModel(this.verifyCodeUseCase)
      : super(VerifyEmailInitialState());
  void verifyEmailCode(String resetCode) async {
    emit(VerifyEmailLoadingState());
    var result = await verifyCodeUseCase.invoke(resetCode);
    switch (result) {
      case Success():
        {
          emit(VerifyEmailSuccessState());
        }
      case Fail():
        {
          emit(VerifyEmailErrorState(result.exception));
        }
      case null:
    }
  }
}

sealed class VerifyEmailState {}

class VerifyEmailInitialState extends VerifyEmailState {}

class VerifyEmailLoadingState extends VerifyEmailState {}

class VerifyEmailErrorState extends VerifyEmailState {
  Exception? exception;
  VerifyEmailErrorState(this.exception);
}

class VerifyEmailSuccessState extends VerifyEmailState {}
