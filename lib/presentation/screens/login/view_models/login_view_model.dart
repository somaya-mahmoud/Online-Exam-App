import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/presentation/base/base_cubit.dart';
import 'package:online_exam_app/presentation/base/base_states.dart';
import 'package:online_exam_app/presentation/screens/login/view_models/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class LoginViewModel extends BaseCubit implements LoginViewModelInput, LoginViewModelOutput {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  LoginViewModel() ;

  @override
  void start() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _rememberMe = prefs.getBool('rememberMe') ?? false;
    if (_rememberMe) {
      _emailController.text = prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
    }
    emit(RememberMeState(_rememberMe));
  }

  @override
  Future<void> login() async {
    emit(LoadingState());

    if (_rememberMe) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('rememberMe', true);
      await prefs.setString('email', _emailController.text);
      await prefs.setString('password', _passwordController.text);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('rememberMe', false);
      await prefs.remove('email');
      await prefs.remove('password');
    }
    emit(SuccessState("Login successful"));  }

  @override
  void toggleRememberMe(bool value) {
    _rememberMe = value;
    emit(RememberMeState(_rememberMe));
  }

  @override
  TextEditingController get getEmailController => _emailController;

  @override
  TextEditingController get getPasswordController => _passwordController;
}

abstract class LoginViewModelInput {
  Future<void> login();
  void toggleRememberMe(bool value);
}

abstract class LoginViewModelOutput {
  TextEditingController get getEmailController;
  TextEditingController get getPasswordController;
}


