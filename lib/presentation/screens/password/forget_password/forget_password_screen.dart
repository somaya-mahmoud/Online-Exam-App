import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/screens/password/forget_password/forget_password_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = 'forget_password';

  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgetPasswordWidget(),
    );
  }
}