
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';

import '../../domain/uses_cases/forget_password_use_cases/forget_password_use_case.dart';
@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState>{
  ForgetPasswordUseCase forgetPasswordUseCase;
  ForgetPasswordViewModel(this.forgetPasswordUseCase):super(ForgetPasswordInitialState());

  void forgetPassword(String email)async{
    emit(ForgetPasswordLoadingState());

    var result = await forgetPasswordUseCase.invoke(email);
    switch(result){

      case Success():{
        emit(ForgetPasswordSuccessState());
      }
      case Fail():{
        emit(ForgetPasswordErrorState(result.errorData));
      }
      case null:
    }
  }
}

sealed class ForgetPasswordState {}
class ForgetPasswordInitialState extends ForgetPasswordState{}
class ForgetPasswordLoadingState extends ForgetPasswordState{}
class ForgetPasswordErrorState extends ForgetPasswordState{
  Exception? exception;
  ForgetPasswordErrorState(this.exception);
}
class ForgetPasswordSuccessState extends ForgetPasswordState{}