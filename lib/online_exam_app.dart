import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theming/theme_manager.dart';
import 'package:online_exam_app/presentation/screens/password/forget_password/forget_password_screen.dart';
import 'package:online_exam_app/presentation/screens/password/reset_password/reset_password_screen.dart';
import 'package:online_exam_app/presentation/screens/password/verify_email/verify_email_screen.dart';

class OnlineExamApp extends StatelessWidget {

  const OnlineExamApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder:(context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online Exam',
        theme: ThemeManager.mainTheme,
        routes: {
          ForgetPasswordScreen.routeName :(_) => const ForgetPasswordScreen()
        },
        initialRoute:ForgetPasswordScreen.routeName,

      ) ,

    );
  }
}