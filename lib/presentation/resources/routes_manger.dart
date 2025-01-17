import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/main_lay_out_screen/view/main_lay_out_vew.dart';
import 'package:online_exam_app/presentation/resources/string_manger.dart';
import 'package:online_exam_app/presentation/screens/password/forget_password/forget_password_screen.dart';
import 'package:online_exam_app/presentation/screens/password/reset_password/reset_password_screen.dart';
import 'package:online_exam_app/presentation/screens/password/verify_email/verify_email_screen.dart';
import 'package:online_exam_app/presentation/screens/profile/profile/profile_screen.dart';
import 'package:online_exam_app/presentation/screens/profile/update_password/update_password_screen.dart';

import '../login/view/login_view.dart';
import '../register_screen/view/register_view.dart';

class Routes {
  Routes._();

  // static const String splashRoute = "/";
  static const String forgetPasswordScreenRoute = "/forgetPasswordScreen";
  static const String registerScreenRoute = "/registerScreen";
  static const String loginScreenRoute = "/loginScreen";
  static const String mainLayOutScreenRoute = "/mainLayOutScreen";
  static const String verifyEmailScreenRoute = "/verifyEmail";
  static const String resetPasswordScreenRoute = "/resetPassword";
  static const String updatePasswordScreenRoute = "/updatePassword";
  static const String profileScreenRoute = "/profilePassword";
}

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.forgetPasswordScreenRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.registerScreenRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.loginScreenRoute:
        return MaterialPageRoute(builder: (_) => LoginViewScreen());
      case Routes.verifyEmailScreenRoute:
        return MaterialPageRoute(builder: (_) => const VerifyEmailScreen());
      case Routes.resetPasswordScreenRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
       case Routes.updatePasswordScreenRoute:
        return MaterialPageRoute(builder: (_) => const UpdatePasswordScreen());
      case Routes.mainLayOutScreenRoute:
        return MaterialPageRoute(builder: (_) => const MainLayOut());
         case Routes.profileScreenRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

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
