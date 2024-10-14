import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theming/colors_manager.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';
import 'package:online_exam_app/di/di.dart';
import 'package:online_exam_app/presentation/view_models/reset_password_view_model.dart';
import 'package:online_exam_app/presentation/widgets/default_elevated_button.dart';
import 'package:online_exam_app/presentation/widgets/default_text_form_field.dart';


class ResetPasswordWidget extends StatelessWidget {

  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  ResetPasswordViewModel resetViewModel = getIt.get<
      ResetPasswordViewModel>();
  var rePasswordController = TextEditingController();

  ResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => resetViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 16.sp,
                color: ColorsManager.blackBase,
              ),
              SizedBox(width: 10.sp),
              Text(
                'Password',
                style: TextStyle(
                  color: ColorsManager.blackBase,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        body: BlocConsumer<ResetPasswordViewModel, ResetPasswordState>(
          listener: (context, state) {
            if(state is ResetPasswordSuccessState){
              DialogUtils.showLoading(context, 'Password Reset Successfully');
            }else if(state is ResetPasswordErrorState){
              DialogUtils.showLoading(context, 'something went wrong');
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 26.h, right: 25.w, left: 25.w),
                          child: Text(
                            'Reset password',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: ColorsManager.blackBase,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          margin: EdgeInsets.all(20.sp),
                          child: Text(
                            'Password must not be empty and must contain '
                                '6 characters with upper case letter \n              and one number at least ',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    margin: EdgeInsets.all(10.sp),
                    child: DefaultTextFormField(
                      controller: passwordController,
                      label: 'New Password',
                      hintText: 'Enter your password',
                      keyBoard: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This Password is not valid";
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.sp),
                    child: DefaultTextFormField(
                      controller: rePasswordController,
                      label: 'Confirm Password',
                      hintText: 'Confirm password',
                      keyBoard: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This password does not match new password";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 48.h,
                    margin: EdgeInsets.only(left: 10.w, right: 10.w),
                    child:
                    DefaultElevatedButton(
                        onPressed: () {
                          resetPassword(passwordController.text,rePasswordController.text);
                        }, label: 'Continue', isValidate: true),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  void resetPassword(String email,String newPassword){
    resetViewModel.resetPassword(email, newPassword);
  }
}
