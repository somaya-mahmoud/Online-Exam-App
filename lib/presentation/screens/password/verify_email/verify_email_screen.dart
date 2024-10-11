import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/screens/password/verify_email/verify_email_widget.dart';

class VerifyEmailScreen extends StatelessWidget {
  static const String routeName = 'verify_email';

  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerifyEmailWidget(),
    );
  }
}