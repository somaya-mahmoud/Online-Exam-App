import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam_app/presentation/common/widgets/default_elevated_button.dart';
import 'package:online_exam_app/presentation/common/widgets/main_app_bar.dart';
import 'package:online_exam_app/presentation/resources/color_manager.dart';
import 'package:online_exam_app/presentation/resources/string_manger.dart';

class StartExamWidget extends StatefulWidget {
  const StartExamWidget({super.key});

  @override
  State<StartExamWidget> createState() => _StartExamWidgetState();
}

class _StartExamWidgetState extends State<StartExamWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMainAppBar(
        context: context,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10.sp),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/Frame.png'),
                SizedBox(
                  height: 10.h,
                ),
                Image.asset('assets/images/Exam.png'),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: double.infinity,
            height: 1.h,
            color: ColorsManager.blue10,
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            margin: EdgeInsets.all(10.sp),
            child: Text(
              AppStrings.instructions,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.blackBase),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.sp),
            child: Row(
              children: [
                Text(
                  '•',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.blackBase,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  AppStrings.defaultStatement,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: ColorsManager.grey),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.sp),
            child: Row(
              children: [
                Text(
                  '•',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.blackBase,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  AppStrings.defaultStatement,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: ColorsManager.grey),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.sp),
            child: Row(
              children: [
                Text(
                  '•',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.blackBase,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  AppStrings.defaultStatement,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: ColorsManager.grey),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.sp),
            child: Row(
              children: [
                Text(
                  '•',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.blackBase,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  AppStrings.defaultStatement,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: ColorsManager.grey),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
              width: double.infinity,
              height: 52.h,
              margin: EdgeInsets.only(left: 10.w, right: 10.w),
              child: DefaultElevatedButton(onPressed: () {}, label: 'Start')),
        ],
      ),
    );
  }
}
