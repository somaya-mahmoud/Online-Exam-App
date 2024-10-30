import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam_app/presentation/resources/color_manager.dart';

import 'language_manager.dart';

class FontConstants {
  static const String primaryEnglishFont = "Inter";
  static const String secondaryArabicFont = "NotoSansArabic";
}

class FontWeightManager {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

class FontSize {
  static const double f0 = 0.0;
  static const double f9 = 9.0;
  static const double f10 = 10.0;
  static const double f12 = 12.0;
  static const double f14 = 14.0;
  static const double f15 = 15.0;
  static const double f16 = 16.0;
  static const double f17 = 17.0;
  static const double f18 = 18.0;
  static const double f19 = 19.0;
  static const double f20 = 20.0;
  static const double f22 = 22.0;
  static const double f24 = 24.0;
  static const double f28 = 28.0;
  static const double f30 = 30.0;
  static const double f32 = 32.0;
  static const double f34 = 34.0;
  static const double f35 = 35.0;
}

class FontManager {
  static getPrimaryFont({
    required BuildContext context,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    if (AppLanguages.getCurrentLang(context) == Languages.en) {
      return GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
    } else {
      return TextStyle(
        color: ColorsManager.blueBase,
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
      );
    }
  }
}
