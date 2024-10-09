import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/presentation/screens/login/login_screen.dart';

class OnlineExamApp extends StatelessWidget {

  const OnlineExamApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online Exam',
        /*   theme: */
        routes: {
          LoginScreen.routeName :(_) => const LoginScreen()
        },
        initialRoute:LoginScreen.routeName,

      ),
    );
  }
}