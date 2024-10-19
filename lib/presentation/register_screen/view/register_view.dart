import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam_app/app/extensions.dart';
import 'package:online_exam_app/presentation/base/base_states.dart';
import 'package:online_exam_app/presentation/base/cubit_listener.dart';
import 'package:online_exam_app/presentation/common/widgets/default_elevated_button.dart';
import 'package:online_exam_app/presentation/register_screen/view_model/register_view_model.dart';
import 'package:online_exam_app/data/api/requests.dart';
import 'package:online_exam_app/presentation/common/validator/validator.dart';
import 'package:online_exam_app/presentation/common/widgets/default_text_form_field.dart';
import 'package:online_exam_app/presentation/resources/color_manager.dart';
import 'package:online_exam_app/presentation/resources/color_manager.dart';
import 'package:online_exam_app/presentation/resources/routes_manger.dart';
import 'package:online_exam_app/presentation/resources/string_manger.dart';
import 'package:online_exam_app/presentation/resources/text_style.dart';
import 'package:online_exam_app/presentation/resources/values_manager.dart';
import '../../../di/di.dart';
import '../../base/cubit_builder.dart';
import '../../common/widgets/main_app_bar.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final RegisterViewModel viewModel = getIt<RegisterViewModel>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocProvider(
        create: (context) => viewModel..start(),
        child: BlocConsumer<RegisterViewModel, BaseState>(
          listener: (context, state) {
            return baseListener(context, state);
          },
          builder: (context, state) {
            return baseBuilder(context, state, _buildRegisterForm(context));
          },
        ),
      ),
    );
  }

  Widget _buildRegisterForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s16),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: AppSize.s30),
              DefaultTextFormField(
                label: AppStrings.userName.tr(),
                hintText: AppStrings.hintUserName.tr(),
                controller: viewModel.getUserNameController,
                validator: AppValidators.validateUsername,
              ),
              Row(
                children: [
                  Expanded(
                    child: DefaultTextFormField(
                      label: AppStrings.firstName.tr(),
                      hintText: AppStrings.hintFirstName.tr(),
                      controller: viewModel.getFirstNameController,
                      validator: AppValidators.validateTextEmpty,
                    ),
                  ),
                  Expanded(
                    child: DefaultTextFormField(
                      label: AppStrings.lastName.tr(),
                      hintText: AppStrings.hintLastName.tr(),
                      controller: viewModel.getLastNameController,
                      validator: AppValidators.validateTextEmpty,
                    ),
                  ),
                ],
              ),
              DefaultTextFormField(
                label: AppStrings.email.tr(),
                hintText: AppStrings.hintEmail.tr(),
                controller: viewModel.getEmailController,
                validator: AppValidators.validateEmail,
              ),
              DefaultTextFormField(
                isObscure: true,
                label: AppStrings.passWord.tr(),
                hintText: AppStrings.hintPassword.tr(),
                controller: viewModel.getPasswordController,
                validator: AppValidators.validatePassword,
              ),
              DefaultTextFormField(
                isObscure: true,
                label: AppStrings.rePassword.tr(),
                hintText: AppStrings.hintRePassword.tr(),
                controller: viewModel.getRePasswordController,
                validator: (val) => AppValidators.validateConfirmPassword(
                  val,
                  viewModel.getPasswordController.text,
                ),
              ),
              DefaultTextFormField(
                label: AppStrings.phone.tr(),
                hintText: AppStrings.hintPhone.tr(),
                controller: viewModel.getPhoneNumberController,
                validator: AppValidators.validatePhoneNumber,
              ),
              const SizedBox(height: AppSize.s20),
              SizedBox(
                width: context.width() * .88,
                height: AppSize.s50,
                child: DefaultElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      UserRequest body = UserRequest(
                          username: viewModel.getUserNameController.text,
                          firstName: viewModel.getFirstNameController.text,
                          lastName: viewModel.getLastNameController.text,
                          email: viewModel.getEmailController.text,
                          password: viewModel.getPasswordController.text,
                          rePassword:
                          viewModel.getRePasswordController.text,
                          phone: viewModel.getPhoneNumberController.text);
                      viewModel.register(body);
                    }
                  },
                  label: AppStrings.register.tr(),
                ),
              ),
              const SizedBox(height: AppSize.s20),

              Row(
                children: [
                  const Spacer(
                    flex: 4,
                  ),
                  Text(
                    AppStrings.haveAnAccount.tr(),
                    style: AppTextStyle.mediumSubtitleColorTextStyle(
                        context, ColorsManager.blackBase),
                  ),
                  const Spacer(),
               TextButton(onPressed: () {
                 Navigator.pushNamed(context, Routes.loginScreenRoute);
               }, child:    Text(
                 AppStrings.login.tr(),
                 style: GoogleFonts.inter(
                   textStyle: const TextStyle(
                     fontWeight: FontWeight.w400 ,
                     color: ColorsManager.blueBase,
                     decoration: TextDecoration.underline,
                     decorationColor: ColorsManager.blueBase,
                   ),
                 ),
               ),),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              ),

              const SizedBox(height: AppSize.s20),

            ],
          ),
        ),
      ),
    );
  }
}
