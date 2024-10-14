import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theming/colors_manager.dart';
import 'package:online_exam_app/core/utils/dialog_utils.dart';
import 'package:online_exam_app/di/di.dart';
import 'package:online_exam_app/presentation/screens/password/verify_email/verify_email_screen.dart';
import 'package:online_exam_app/presentation/view_models/forget_password_view_model.dart';
import 'package:online_exam_app/presentation/widgets/default_elevated_button.dart';
import 'package:online_exam_app/presentation/widgets/default_text_form_field.dart';

class ForgetPasswordWidget extends StatelessWidget {
  ForgetPasswordWidget({super.key});

  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  ForgetPasswordViewModel forgetViewModel = getIt.get<
      ForgetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => forgetViewModel,
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
        body: BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
          listener: (context, state) {
           if(state is ForgetPasswordSuccessState){
            DialogUtils.showLoading(context, 'OTP sent to your email');
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VerifyEmailScreen(),));
           }else if(state is ForgetPasswordErrorState){
             DialogUtils.showLoading(context, 'Invalid Email');
           }
          },
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding:
                        EdgeInsets.only(top: 26.h, right: 25.w, left: 25.w),
                        child: Text(
                          'Forget password',
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
                          'Please enter your email associated to\n             '
                              '         your account',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
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
                      label: 'Email',
                      hintText: 'Enter your email',
                      keyBoard: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This Email is not valid";
                        }
                      }),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  width: double.infinity,
                  height: 48.h,
                  margin: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: DefaultElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                                forgetPassword(emailController.text);
                        }
                      }, label: 'Continue', isValidate: true),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void forgetPassword(String email){
   forgetViewModel.forgetPassword(email);
  }
}
