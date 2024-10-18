import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/register_screen/view/register_view.dart';
import 'package:online_exam_app/presentation/resources/string_manger.dart';

import '../screens/password/forget_password/forget_password_screen.dart';
class Routes{
  Routes._();

  // static const String splashRoute = "/";
  static const String forgetPasswordScreenRoute = "/forgetPasswordScreen";
  static const String registerScreenRoute = "/registerScreen";

}


class RouteGenerator{
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.forgetPasswordScreenRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.registerScreenRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      default:
        return unDefinedRoute();
    }

  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noRouteFound.tr()),
        ),
        body: Center(child: Text(AppStrings.noRouteFound.tr())),
      ),
    );
  }

}