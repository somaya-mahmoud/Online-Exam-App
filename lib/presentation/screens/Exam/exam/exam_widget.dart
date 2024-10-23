import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:online_exam_app/presentation/common/widgets/default_elevated_button.dart';
import 'package:online_exam_app/presentation/common/widgets/main_app_bar.dart';
import 'package:online_exam_app/presentation/resources/color_manager.dart';
import 'package:online_exam_app/presentation/resources/string_manger.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class ExamWidget extends StatefulWidget {
  const ExamWidget({super.key});

  @override
  State<ExamWidget> createState() => _ExamWidgetState();
}

class _ExamWidgetState extends State<ExamWidget> {
  int currentStep = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMainAppBar(
        context: context,
        title: Text(
          AppStrings.exam,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: ColorsManager.blackBase,
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(6.sp),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/alarm.png',
                  fit: BoxFit.contain,
                  width: 40,
                  height: 40,
                ),
                Text(
                  AppStrings.time,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: ColorsManager.success,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              AppStrings.questionNumber,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: ColorsManager.grey,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: LinearProgressBar(
                maxSteps: 6,
                progressType: LinearProgressBar.progressTypeLinear,
                currentStep: currentStep,
                progressColor: ColorsManager.blueBase,
                backgroundColor: ColorsManager.black10,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(ColorsManager.blueBase),
                semanticsLabel: "Label",
                semanticsValue: "Value",
                minHeight: 6,
                //  NEW
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            AppStrings.questionSelect,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: ColorsManager.blackBase,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 400.h,
              padding: EdgeInsets.all(10.sp),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 70.h,
                        child: Card(
                          color: ColorsManager.lightBlue,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5.sp),
                                child: RoundCheckBox(
                                  onTap: (selected) {},
                                  borderColor: ColorsManager.blueBase,
                                  checkedColor: ColorsManager.white,
                                  isChecked: false,
                                  size: 25.sp,
                                  checkedWidget: SvgPicture.asset(
                                    'assets/svg/dot.svg',
                                    color: ColorsManager.blueBase,
                                  ),
                            ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                AppStrings.questionOne,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: ColorsManager.blackBase,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 4,
                scrollDirection: Axis.vertical,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 52.h,
                width: 150.w,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: const BorderSide(color: ColorsManager.blueBase)),
                    ),
                  ),
                  child: Text(
                    AppStrings.back,
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: ColorsManager.blueBase,
                        )),
                  ),
                ),
              ),
              Container(
                  height: 52.h,
                  width: 150.w,
                  child:ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(ColorsManager.blueBase),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(color: ColorsManager.blueBase)),
                      ),
                    ),
                    child: Text(
                      AppStrings.next,
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: ColorsManager.white,
                          )),
                    ),
                  ), ),

            ],
          ),
        ],
      ),
    );
  }
}
