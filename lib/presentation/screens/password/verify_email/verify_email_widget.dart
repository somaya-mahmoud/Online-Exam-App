import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam_app/core/theming/colors_manager.dart';

class VerifyEmailWidget extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  VerifyEmailWidget({super.key});

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
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 26.h, right: 25.w, left: 25.w),
              child: Text(
                'Email verification',
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
                ' Please enter your code that send to your  \n             '
                '         email address',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 2,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(20.sp),
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.sp),
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.sp),
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.sp),
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/svg/warning_circle.svg',
                      color: ColorsManager.error,
                      width: 35.w,
                      height: 35.h,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    'Invalid code',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.error,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn\'t receive code?',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend',
                      style: TextStyle(
                        color: ColorsManager.blueBase,
                        fontSize: 15.sp,
                        decoration: TextDecoration.underline,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
