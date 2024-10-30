import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/resources/string_manger.dart';
import 'package:online_exam_app/presentation/screens/Exam/exam/exam_screen.dart';
import 'package:online_exam_app/presentation/screens/Exam/exams/exams_screen.dart';
import 'package:online_exam_app/presentation/screens/Exam/explore/explore_subjects_screen.dart';
import 'package:online_exam_app/presentation/screens/Exam/score_screen/score_screen.dart';
import 'package:online_exam_app/presentation/screens/Exam/start_exam/start_exam_screen.dart';
import 'package:online_exam_app/presentation/screens/home_screen/view.dart';
import 'package:online_exam_app/presentation/screens/login/view/login_view.dart';
import 'package:online_exam_app/presentation/screens/password/forget_password/forget_password_screen.dart';
import 'package:online_exam_app/presentation/screens/password/reset_password/reset_password_screen.dart';
import 'package:online_exam_app/presentation/screens/password/verify_email/verify_email_screen.dart';
import 'package:online_exam_app/presentation/screens/profile/profile/profile_screen.dart';
import 'package:online_exam_app/presentation/screens/profile/update_password/update_password_screen.dart';
import 'package:online_exam_app/presentation/screens/register_screen/view/register_view.dart';

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
  static const String exploreSubjectsScreenRoute = "/exploreSubjectsScreen";
  static const String startExamScreenRoute = "/startExamScreen";
  static const String scoreScreenRoute = "/scoreScreen";
  static const String examScreenRoute = "/examScreen";
  static const String homeScreenRoute = "/homeScreen";
  static const String examsScreenRoute = "/examsScreen";
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
         case Routes.profileScreenRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.exploreSubjectsScreenRoute:
        return MaterialPageRoute(builder: (_) => const ExploreSubjectsScreen());
      case Routes.examScreenRoute:
        return MaterialPageRoute(builder: (_) => const ExamScreen());
      case Routes.scoreScreenRoute:
        return MaterialPageRoute(builder: (_) => const ScoreScreen());
      case Routes.startExamScreenRoute:
        return MaterialPageRoute(builder: (_) => const StartExamScreen());

      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.examsScreenRoute:
        return MaterialPageRoute(builder: (_) => const ExamsScreen());

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
