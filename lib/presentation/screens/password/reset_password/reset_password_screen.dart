import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/screens/password/reset_password/reset_password_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = 'reset_password';

  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetPasswordWidget(),
    );
  }
}
