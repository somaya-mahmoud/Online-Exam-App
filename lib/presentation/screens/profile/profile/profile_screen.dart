import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/screens/profile/profile/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String routeName = 'profile_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileWidget(),
    );
  }
}
