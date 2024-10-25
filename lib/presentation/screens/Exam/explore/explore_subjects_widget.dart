import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam_app/data/models/exam_response/SubjectsResponse.dart';
import 'package:online_exam_app/di/di.dart';
import 'package:online_exam_app/presentation/common/widgets/error_dialog.dart';
import 'package:online_exam_app/presentation/common/widgets/show_loading_dialog.dart';
import 'package:online_exam_app/presentation/resources/colors_manager.dart';
import 'package:online_exam_app/presentation/resources/string_manger.dart';
import 'package:online_exam_app/presentation/view_models/exam_view_models/subjects_view_model.dart';
import 'package:online_exam_app/utils/utils.dart';

class ExploreSubjectsWidget extends StatefulWidget {
  const ExploreSubjectsWidget({super.key});

  @override
  State<ExploreSubjectsWidget> createState() => _ExploreSubjectsWidgetState();
}

class _ExploreSubjectsWidgetState extends State<ExploreSubjectsWidget> {
  var searchController = TextEditingController();
  SubjectsViewModel subjectsViewModel = getIt.get<SubjectsViewModel>();
     List<Subjects> subjects = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => subjectsViewModel,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/explore.svg'), label: ''),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/result.png'), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/svg/profile.svg'), label: ''),
          ],
          backgroundColor: ColorsManager.lightBlue,
          type: BottomNavigationBarType.fixed,
        ),
        body: BlocListener<SubjectsViewModel, GetSubjectsState>(
          listenWhen: (previous, current) {
            if (current is GetSubjectsLoadingState ||
                current is GetSubjectsErrorState ||
                current is GetSubjectsSuccessState) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state is GetSubjectsLoadingState) {
              showLoadingDialog(context);
            } else if (state is GetSubjectsSuccessState) {
              print('subjectssssssssssssssssssssss');
              // Future.delayed(const Duration(seconds: 1),() {
              //   Navigator.pushNamed(context, Routes.verifyEmailScreenRoute);
              // },);
            }
            else if (state is GetSubjectsErrorState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop(); // Close loading dialog
              showErrorDialog(context, message);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 24.sp, left: 24.sp),
                child: Text(
                  AppStrings.survey,
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.blueBase,
                  )),
                ),
              ),
              Container(
                height: 50.h,
                margin: EdgeInsets.all(14.sp),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  onTap: () {},
                  decoration: InputDecoration(
                      prefixIcon: Container(
                        margin: EdgeInsets.only(top: 4.h, left: 16.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: ColorsManager.black30,
                              size: 20.sp,
                            ),
                            Text(
                              AppStrings.search,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: ColorsManager.black30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.sp),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25.h, left: 18.w),
                child: Text(AppStrings.browseBySubject,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.blackBase),
                    )),
              ),
              SizedBox(
                height: 12.h,
              ),
              SingleChildScrollView(
                child: Container(
                  height: 400.h,
                  padding: EdgeInsets.all(10.sp),
                  child: BlocBuilder<SubjectsViewModel, GetSubjectsState>(
                    builder: (context, state) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 80.h,
                                child: Card(
                                  color: ColorsManager.white,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height:50.h,
                                        child:Image.network(
                                          subjects[index].icon ??'',
                                          //'assets/images/language.png',
                                          width: 48.w,
                                          height: 48.h,
                                        ),
                                      ),
                                      Text(
                                        subjects[index].name ??
                                            '',
                                        // AppStrings.languageSvg,
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp,
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
                        itemCount:subjects.length,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
  void getSubjects(String token){
    subjectsViewModel.getSubjects(token);
  }
}
