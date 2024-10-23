import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/presentation/common/validator/validator.dart';
import 'package:online_exam_app/presentation/common/widgets/default_elevated_button.dart';
import 'package:online_exam_app/presentation/common/widgets/default_text_form_field.dart';
import 'package:online_exam_app/presentation/common/widgets/error_dialog.dart';
import 'package:online_exam_app/presentation/common/widgets/show_loading_dialog.dart';
import 'package:online_exam_app/presentation/resources/colors_manager.dart';
import 'package:online_exam_app/utils/utils.dart';
import 'package:online_exam_app/di/di.dart';
import 'package:online_exam_app/presentation/view_models/password_view_models/reset_password_view_model.dart';

class ResetPasswordWidget extends StatelessWidget {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  ResetPasswordViewModel resetViewModel = getIt.get<ResetPasswordViewModel>();
  var rePasswordController = TextEditingController();

  ResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => resetViewModel,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
          listenWhen: (previous, current) {
            if (current is ResetPasswordLoadingState ||
                current is ResetPasswordErrorState ||
                current is ResetPasswordSuccessState) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state is ResetPasswordLoadingState) {
              showLoadingDialog(context);
              Navigator.pop(context);
            } else if (state is ResetPasswordErrorState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop();
              showErrorDialog(context, message);
            } else if (state is ResetPasswordSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Password Updated Successfully')));
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
                      controller: emailController,
                      label: 'New Password',
                      hintText: 'Enter your password',
                      keyBoard: TextInputType.emailAddress,
                      validator: AppValidators.validatePassword,
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
                        AppValidators.validateConfirmPassword(
                            value, rePasswordController.text);
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
                        BlocBuilder<ResetPasswordViewModel, ResetPasswordState>(
                      builder: (context, state) {
                        return DefaultElevatedButton(
                            onPressed: () {
                              resetPassword(emailController.text,
                                  rePasswordController.text);
                            },
                            label: 'Continue',
                            isValidate: true);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void resetPassword(String email, String newPassword) {
    resetViewModel.resetPassword(email, newPassword);
  }
}
