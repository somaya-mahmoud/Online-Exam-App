import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam_app/di/di.dart';
import 'package:online_exam_app/presentation/common/widgets/error_dialog.dart';
import 'package:online_exam_app/presentation/common/widgets/main_app_bar.dart';
import 'package:online_exam_app/presentation/common/widgets/show_loading_dialog.dart';
import 'package:online_exam_app/presentation/resources/color_manager.dart';
import 'package:online_exam_app/presentation/resources/string_manger.dart';
import 'package:online_exam_app/presentation/view_models/exam_view_models/exams_view_model.dart';
import 'package:online_exam_app/utils/utils.dart';

class ExamsWidget extends StatelessWidget {
  ExamsWidget({super.key});

  ExamsViewModel examsViewModel = getIt.get<ExamsViewModel>()..getExams();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => examsViewModel,
      child: Scaffold(
        appBar: buildMainAppBar(
            context: context,
            title: Text(
              AppStrings.languageTitle,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.blackBase,
                ),
              ),
            )),
        body: BlocListener<ExamsViewModel, GetExamsState>(
          listener: (context, state) {
            if (state is GetExamsLoadingState) {
              showLoadingDialog(context);
            } else if (state is GetExamsSuccessState) {
              // Future.delayed(const Duration(seconds: 1),() {
              //
              // },);
            } else if (state is GetExamsErrorState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop(); // Close loading dialog
              showErrorDialog(context, message);
            }
          },
          child: BlocBuilder<ExamsViewModel, GetExamsState>(
            builder: (context, state) {
              return state is GetExamsSuccessState
                  ? SingleChildScrollView(
                    child: Container(
                      height: 600.h,
                      child: ListView.builder(
                          itemCount: state.exams.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: ColorsManager.white,
                              elevation: 11,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/Profit.png',
                                      height: 71.h,
                                      width: 60.w,
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(state.exams[index].title,
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500,
                                                color: ColorsManager.blackBase,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${state.exams[index].numberOfQuestions} Questions',
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w400,
                                                color: ColorsManager.grey,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'From: 1.00 To: 6.00',
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w400,
                                                color: ColorsManager.blackBase,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '${state.exams[index].duration} Minutes',
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: ColorsManager.blueBase,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                  : const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
