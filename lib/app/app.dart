import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/presentation/resources/theme_manager.dart';
import '../presentation/resources/routes_manger.dart';
import 'package:easy_localization/easy_localization.dart';

class OnlineExamApp extends StatelessWidget {

  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder:(context, child) =>  MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.scoreScreenRoute,
        theme: ThemeManager.mainTheme,
        onGenerateRoute: RouteGenerator.getRoute,

      ) ,

    );
  }
}