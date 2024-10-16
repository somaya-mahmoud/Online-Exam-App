import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam_app/core/theming/colors_manager.dart';
import 'package:online_exam_app/di/di.dart';
import 'package:online_exam_app/presentation/screens/password/forget_password/forget_password_screen.dart';
import 'package:online_exam_app/presentation/screens/password/reset_password/reset_password_screen.dart';
import 'package:online_exam_app/presentation/view_models/password_view_models/verify_email_view_model.dart';
import 'package:online_exam_app/presentation/widgets/error_dialog.dart';
import 'package:online_exam_app/presentation/widgets/show_loading_dialog.dart';
import 'package:online_exam_app/utils/utils.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class VerifyEmailWidget extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  VerifyEmailWidget({super.key});

  var resetCode = TextEditingController();
  VerifyEmailViewModel verifyViewModel = getIt.get<VerifyEmailViewModel>();
  final TextEditingController pinCodeController1 = TextEditingController();
  final TextEditingController pinCodeController2 = TextEditingController();
  final TextEditingController pinCodeController3 = TextEditingController();
  final TextEditingController pinCodeController4 = TextEditingController();
  final TextEditingController pinCodeController5 = TextEditingController();
  final TextEditingController pinCodeController6 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => verifyViewModel,
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
        body: BlocListener<VerifyEmailViewModel, VerifyEmailState>(
          listenWhen: (previous, current) {
            if (current is VerifyEmailLoadingState ||
                current is VerifyEmailErrorState ||
                current is VerifyEmailSuccessState) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state is VerifyEmailLoadingState) {
              showLoadingDialog(context);
            } else if (state is VerifyEmailErrorState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop();
              showErrorDialog(context, message);
            } else if (state is VerifyEmailSuccessState) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ResetPasswordScreen(),
              ));
            }
          },
          child: Form(
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
                BlocBuilder<VerifyEmailViewModel, VerifyEmailState>(
                  builder: (context, state) {
                    return Directionality(
                      textDirection: TextDirection.ltr,
                      child: PinCodeTextField(
                        autofocus: true,
                        controller: resetCode,
                        hideCharacter: false,
                        highlight: true,
                        maxLength: 6,
                        onTextChanged: (text) {},
                        onDone: (text) {
                          print("DONE $text");
                          print("DONE CONTROLLER ${resetCode.text}");
                          verifyEmailCode(resetCode.text);
                        },
                        pinBoxWidth: 70,
                        pinBoxHeight: 68,
                        hasUnderline: false,
                        wrapAlignment: WrapAlignment.spaceAround,
                        pinBoxDecoration:
                            ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                        pinTextStyle: const TextStyle(fontSize: 22.0),
                        pinTextAnimatedSwitcherTransition:
                            ProvidedPinBoxTextAnimation.scalingTransition,
                        pinTextAnimatedSwitcherDuration:
                            const Duration(milliseconds: 2000),
                        highlightAnimationBeginColor: Colors.black,
                        highlightAnimationEndColor: Colors.white12,
                        keyboardType: TextInputType.number,
                      ),
                    );
                  },
                ),
                /*  Container(
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
                ),*/
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
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ForgetPasswordScreen(),
                          ));
                        },
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
        ),
      ),
    );
  }

  void verifyEmailCode(String resetCode) {
    String n1 = pinCodeController1.text.toString();
    String n2 = pinCodeController2.text.toString();
    String n3 = pinCodeController3.text.toString();
    String n4 = pinCodeController4.text.toString();
    String n5 = pinCodeController5.text.toString();
    String n6 = pinCodeController6.text.toString();
    String resetCode = n1 + n2 + n3 + n4 + n5 + n6;
    verifyViewModel.verifyEmailCode(resetCode);
  }
}
