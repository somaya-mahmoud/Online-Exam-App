import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/presentation/resources/colors_manager.dart';
import 'package:online_exam_app/di/di.dart';
import 'package:online_exam_app/presentation/view_models/forget_password_view_model.dart';
import 'package:online_exam_app/presentation/common/widgets/default_text_form_field.dart';

import '../../../common/widgets/default_elevated_button.dart';

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
          listenWhen:(previous,current){
             return true;
          },
          listener: (context, state) {
           if(state is ForgetPasswordLoadingState){
             showDialog(context: context, builder:(context){
               return const AlertDialog(
               content: Row(
               children: [
                 CircularProgressIndicator(),
                 Text('Loading....'),
             ],
               ),
               );
             });
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
                          forgetViewModel.forgetPassword(emailController.text);
                        }
                      }, label: 'Continue', isValidate: true),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     if (formKey.currentState!.validate()) {}
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: ColorsManager.blueBase,
                  //   ),
                  //   child: Text(
                  //     'Continue',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 18.sp,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
