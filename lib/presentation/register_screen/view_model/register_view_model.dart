import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/uses_cases/register_user_use_case.dart';
import 'package:online_exam_app/presentation/base/base_cubit.dart';
import 'package:online_exam_app/presentation/base/base_states.dart';
import '../../../data/api/requests.dart';
import '../../../data/networking/error/error_handler.dart';
import '../../../data/response/response.dart';
import '../../../domain/common/ApiResult.dart';

@injectable
@injectable
class RegisterViewModel extends BaseCubit
    implements RegisterViewModelInput, RegisterViewModelOutput {
  final RegisterUseCase _registerUserUseCase;

  RegisterViewModel(this._registerUserUseCase);

  // Define controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  @override
  Future<void> register(UserRequest request) async {
    emit(LoadingState());

    final ApiResult<AuthResponse> result =
        await _registerUserUseCase.call(request);

    if (result is Success<AuthResponse>) {
      emit(
          SuccessState(result.resultData.message ?? "Registration successful"));
      Future.delayed(const Duration(seconds: 1), () {
        resetState();
      });
    } else if (result is Fail<AuthResponse>) {
      final errorModel = ErrorHandler.handle(result.errorData as Exception);
      emit(ErrorState(errorModel.message ?? "An error occurred , try again"));
    } else {
      emit(ErrorState("Unexpected error occurred!!!"));
    }
  }

  void resetState() {
    emit(InitialState());
  }

  @override
  TextEditingController get getEmailController => _emailController;
  @override
  TextEditingController get getFirstNameController => _firstNameController;
  @override
  TextEditingController get getLastNameController => _lastNameController;
  @override
  TextEditingController get getPhoneNumberController => _phoneNumberController;
  @override
  TextEditingController get getUserNameController => _userNameController;
  @override
  TextEditingController get getPasswordController => _passwordController;
  @override
  TextEditingController get getRePasswordController => _rePasswordController;

  @override
  void start() {}
}

abstract class RegisterViewModelInput {
  Future<void> register(UserRequest request);
}

abstract class RegisterViewModelOutput {
  TextEditingController get getEmailController;
  TextEditingController get getFirstNameController;
  TextEditingController get getLastNameController;
  TextEditingController get getPhoneNumberController;
  TextEditingController get getUserNameController;
  TextEditingController get getPasswordController;
  TextEditingController get getRePasswordController;
}