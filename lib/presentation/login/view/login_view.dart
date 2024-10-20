import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam_app/app/extensions.dart';
import 'package:online_exam_app/presentation/login/view_models/login_view_model.dart';

import '../../../di/di.dart';
import '../../base/base_states.dart';
import '../../base/cubit_builder.dart';
import '../../common/validator/validator.dart';
import '../../common/widgets/default_elevated_button.dart';
import '../../common/widgets/default_text_form_field.dart';
import '../../common/widgets/main_app_bar.dart';
import '../../resources/color_manager.dart';
import '../../resources/string_manger.dart';
import '../../resources/text_style.dart';
import '../../resources/values_manager.dart';
import '../view_models/states.dart';

class LoginViewScreen extends StatelessWidget {
  LoginViewScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMainAppBar(
        context: context,
        title: Text(AppStrings.login.tr(), style: AppTextStyle.semiBoldHeadingTextStyle(context)),
        canChangeLanguage: true,
      ),
      body: BlocProvider(
        create: (context) => viewModel..start(),
        child: BlocConsumer<LoginViewModel, BaseState>(
          listener: (context, state) {
            if (state is SuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return baseBuilder(context, state, _buildLoginForm(context, state));
          },
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, BaseState state) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s16),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: AppSize.s30),
              DefaultTextFormField(
                label: AppStrings.email.tr(),
                hintText: AppStrings.hintEmail.tr(),
                controller: viewModel.getEmailController,
                validator: AppValidators.validateEmail,
              ),
              DefaultTextFormField(
                label: AppStrings.passWord.tr(),
                hintText: AppStrings.hintPassword.tr(),
                controller: viewModel.getPasswordController,
                validator: AppValidators.validatePassword,
              ),
              const SizedBox(height: AppSize.s5),

              Row(
                children: [
                  BlocBuilder<LoginViewModel, BaseState>(
                    builder: (context, state) {
                      bool isRemembered = false;
                      if (state is RememberMeState) {
                        isRemembered = state.isRemembered;
                      }
                      return Checkbox(
                        activeColor: ColorsManager.blueBase,
                        focusColor: ColorsManager.blueBase,
                        value: isRemembered,
                        onChanged: (bool? value) {
                          viewModel.toggleRememberMe(value ?? false);
                        },
                      );
                    },
                  ),
                  Text(AppStrings.rememberMe.tr(), style: AppTextStyle.smallSemiBoldHeadingTextStyle(context)),
                  const Spacer(),
                  Text(
                    AppStrings.forGetPassword.tr(),
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: AppSize.s12,
                          color: ColorsManager.blackBase,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorsManager.blueBase,
                        )
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSize.s20),

              SizedBox(
                width: context.width() * .88,
                height: AppSize.s50,
                child: DefaultElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      viewModel.login();
                    }
                  },
                  label: AppStrings.login.tr(),
                ),
              ),

              const SizedBox(height: AppSize.s20),

              Row(
                children: [
                  const Spacer(flex: 4),
                  Text(
                    AppStrings.donotHaveAnAccount.tr(),
                    style: AppTextStyle.mediumSubtitleColorTextStyle(context, ColorsManager.blackBase),
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.register.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.blueBase,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorsManager.blueBase,
                    ),
                  ),
                  const Spacer(flex: 4),
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
