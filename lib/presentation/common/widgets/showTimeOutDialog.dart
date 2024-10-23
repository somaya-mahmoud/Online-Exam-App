import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam_app/presentation/common/widgets/default_elevated_button.dart';
import 'package:online_exam_app/presentation/resources/color_manager.dart';
import 'package:online_exam_app/presentation/resources/routes_manger.dart';
import 'package:online_exam_app/presentation/resources/string_manger.dart';
void showTimeOutDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context)
  {
    return
      Center(
        child: SizedBox(
          height: 250.h,
          child: AlertDialog(
            content: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svg/sand.svg'),
                    SizedBox(width: 10.sp),
                    Text(
                      AppStrings.timeOut,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 24.sp,
                          color: ColorsManager.error,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h,),
                Container(
                  width: double.infinity,
                  height: 48.h,
                  margin: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: DefaultElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.scoreScreenRoute);
                      }, label: AppStrings.viewScore,
                      isValidate: true),
                ),
              ],
            ),
          ),
        ),
      );
  }
  );
}

