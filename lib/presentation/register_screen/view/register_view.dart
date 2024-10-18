import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/presentation/base/base_states.dart';
import 'package:online_exam_app/presentation/base/cubit_listener.dart';
import 'package:online_exam_app/presentation/common/widgets/default_elevated_button.dart';
import 'package:online_exam_app/presentation/register_screen/view_model/register_view_model.dart';
import 'package:online_exam_app/data/api/requests.dart';
import 'package:online_exam_app/presentation/common/validator/validator.dart';
import 'package:online_exam_app/presentation/common/widgets/default_text_form_field.dart';
import 'package:online_exam_app/presentation/resources/string_manger.dart';
import 'package:online_exam_app/presentation/resources/values_manager.dart';
import '../../../di/di.dart';
import '../../base/cubit_builder.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel viewModel = getIt<RegisterViewModel>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isFormValid = false; // Variable to track form validation

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
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppSize.s30),
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
              Row(
                children: [
                  Expanded(
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
                      label: 'register',
                      isValidate: isFormValid,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    setState(() {
      isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  void _submitForm() {
    if (isFormValid) {
      viewModel.register(
        UserRequest(
          username: viewModel.getUserNameController.text.trim(),
          firstName: viewModel.getFirstNameController.text.trim(),
          lastName: viewModel.getLastNameController.text.trim(),
          email: viewModel.getEmailController.text.trim(),
          phone: viewModel.getPhoneNumberController.text.trim(),
          password: viewModel.getPasswordController.text.trim(),
          rePassword: viewModel.getRePasswordController.text.trim(),
        ),
      );
    }
  }
}
