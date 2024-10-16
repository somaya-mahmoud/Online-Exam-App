import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/screens/profile/update_password/update_password_widget.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});
  static const String routeName = 'update_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UpdatePasswordWidget(),
    );
  }
}
