import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/resources/style_manger.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'language_manager.dart';

class AppTextStyle {
  AppTextStyle._();

  // Bold Text Styles
  static TextStyle boldTextStyle(BuildContext context, {Color? color, double? fontSize}) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: color ?? ColorsManager.blackBase,
        fontSize: fontSize ?? FontSize.f22,
      );

  static TextStyle boldTitleTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorsManager.blackBase,
        fontSize: FontSize.f30,
      );

  static TextStyle boldButtonTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorsManager.white,
        fontSize: FontSize.f18,
      );

  // Regular Text Styles
  static TextStyle regularTextStyle(BuildContext context, {Color? color, double? fontSize}) =>
      getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: color ?? ColorsManager.blackBase,
        fontSize: fontSize ?? FontSize.f20,
      );

  static TextStyle regularSubtitleTextStyle(BuildContext context) =>
      getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorsManager.grey,
        fontSize: FontSize.f16,
      );

  // Light Text Styles
  static TextStyle lightTextStyle(BuildContext context, {Color? color, double? fontSize}) =>
      getLightStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: color ?? ColorsManager.grey,
        fontSize: fontSize ?? FontSize.f18,
      );

  static TextStyle lightTitleTextStyle(BuildContext context) =>
      getLightStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorsManager.white,
        fontSize: FontSize.f24,
      );

  // Semi-Bold Text Styles
  static TextStyle semiBoldTextStyle(BuildContext context, {Color? color, double? fontSize}) =>
      getSemiBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: color ?? ColorsManager.blackBase,
        fontSize: fontSize ?? FontSize.f20,
      );

  static TextStyle semiBoldHeadingTextStyle(BuildContext context) =>
      getSemiBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorsManager.blackBase,
        fontSize: FontSize.f22,
      );

  static TextStyle smallSemiBoldHeadingTextStyle(BuildContext context) =>
      getSemiBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorsManager.blackBase,
        fontSize: FontSize.f14,
      );

  // Medium Text Styles
  static TextStyle mediumTextStyle(BuildContext context, {Color? color, double? fontSize}) =>
      getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: color ?? ColorsManager.blackBase,
        fontSize: fontSize ?? FontSize.f18,
      );

  static TextStyle mediumSubtitleTextStyle(BuildContext context) =>
      getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorsManager.grey,
        fontSize: FontSize.f16,
      );
  static TextStyle mediumSubtitleColorTextStyle(BuildContext context,Color color) =>
      getMediumStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: color,
        fontSize: FontSize.f16,
      );

}
