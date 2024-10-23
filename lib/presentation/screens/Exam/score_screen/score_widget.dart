import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam_app/presentation/common/widgets/default_elevated_button.dart';
import 'package:online_exam_app/presentation/common/widgets/main_app_bar.dart';
import 'package:online_exam_app/presentation/common/widgets/showTimeOutDialog.dart';
import 'package:online_exam_app/presentation/resources/color_manager.dart';
import 'package:online_exam_app/presentation/resources/string_manger.dart';

class ScoreWidget extends StatefulWidget {
  const ScoreWidget({super.key});

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMainAppBar(
          context: context,
          title: Text(
            AppStrings.examScore,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                color: ColorsManager.blackBase,
              ),
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(15.sp),
            child: Text(
              AppStrings.yourScore,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.blackBase,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10.sp),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/circular.svg',
                      width: 150.w,
                      height: 150.h,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      AppStrings.percentage,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.blackBase,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        AppStrings.correct,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorsManager.blueBase,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 70.w,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorsManager.blueBase,
                                width: 2.0,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 14.sp,
                              backgroundColor: ColorsManager.white,
                            ),
                          ),
                          Text(
                            AppStrings.correctQuestions,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorsManager.blueBase,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        AppStrings.inCorrect,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorsManager.error,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60.w,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorsManager.error,
                                width: 2.0,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 14.sp,
                              backgroundColor: ColorsManager.white,
                            ),
                          ),
                          Text(
                            AppStrings.inCorrectQuestions,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorsManager.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 35.sp,
          ),
          Container(
              width: double.infinity,
              height: 52.h,
              margin: EdgeInsets.only(left: 12.w, right: 12.w),
              child: DefaultElevatedButton(
                  onPressed: () {}, label: AppStrings.showResults)),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: double.infinity,
            height: 52.h,
            margin: EdgeInsets.only(left: 14.w, right: 14.w),
            child: ElevatedButton(
              onPressed: () {
              },
              style: ButtonStyle(

                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      side: const BorderSide(color: ColorsManager.blueBase)),
                ),
              ),
              child: Text(
                AppStrings.startAgain,
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: ColorsManager.blueBase,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
