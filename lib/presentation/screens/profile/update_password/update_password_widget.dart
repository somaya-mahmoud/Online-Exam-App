import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theming/colors_manager.dart';
import 'package:online_exam_app/presentation/widgets/default_elevated_button.dart';
import 'package:online_exam_app/presentation/widgets/default_text_form_field.dart';

class UpdatePasswordWidget extends StatelessWidget {
  UpdatePasswordWidget({super.key});
  var formKey = GlobalKey<FormState>();
  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Reset password',
              style: TextStyle(
                color: ColorsManager.blackBase,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.sp),
                child: DefaultTextFormField(
                    controller: currentPasswordController,
                    label: 'Current Password',
                    hintText: 'Current Password',
                    keyBoard: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This Password is not valid";
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.all(10.sp),
                child: DefaultTextFormField(
                    controller: currentPasswordController,
                    label: 'New Password',
                    hintText: 'New Password',
                    keyBoard: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      }
                    }),
              ),
              Container(
                margin: EdgeInsets.all(10.sp),
                child: DefaultTextFormField(
                    controller: currentPasswordController,
                    label: 'Confirm Password',
                    hintText: 'Confirm Password',
                    keyBoard: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
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
                      if (formKey.currentState!.validate()) {}
                    },
                    label: 'Update',
                    isValidate: false),
              ),
            ],
          )),
    );
  }
}
