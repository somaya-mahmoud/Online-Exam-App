import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_exam_app/core/theming/colors_manager.dart';
import 'package:online_exam_app/di/di.dart';
import 'package:online_exam_app/presentation/screens/profile/update_password/update_password_screen.dart';
import 'package:online_exam_app/presentation/view_models/profile_view_models/edit_profile_view_model.dart';
import 'package:online_exam_app/presentation/widgets/default_elevated_button.dart';
import 'package:online_exam_app/presentation/widgets/default_text_form_field.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  var formKey = GlobalKey<FormState>();

  var userController = TextEditingController();

  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var phoneController = TextEditingController();

  late File selectedImage;
  EditProfileViewModel editProfileViewModel = getIt.get<EditProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => editProfileViewModel,
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
        body: BlocConsumer<EditProfileViewModel, EditProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                  child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [
                                Color(0xff833ab4),
                                Color(0xfffd1d1d),
                                Color(0xfffcb045),
                              ])),
                        ),
                      ),
                      buildProfileImage(),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10.sp),
                    child: DefaultTextFormField(
                        controller: userController,
                        label: 'User name',
                        hintText: 'Somaya mahmoud',
                        keyBoard: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          }
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 180.w,
                        child: DefaultTextFormField(
                            controller: firstNameController,
                            label: 'First name',
                            hintText: 'Somaya ',
                            keyBoard: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                            }),
                      ),
                      Container(
                        width: 180.w,
                        child: DefaultTextFormField(
                            controller: lastNameController,
                            label: 'Last name',
                            hintText: 'Mahmoud ',
                            keyBoard: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                            }),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10.sp),
                    child: DefaultTextFormField(
                        controller: emailController,
                        label: 'Email',
                        hintText: 'somayamahmoud@gmail.com',
                        keyBoard: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          }
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.sp),
                    child: DefaultTextFormField(
                        controller: passwordController,
                        label: 'password',
                        hintText: '**********',
                        keyBoard: TextInputType.visiblePassword,
                        textButton: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, UpdatePasswordScreen.routeName);
                            },
                            child: Text(
                              'Change',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ColorsManager.blueBase,
                                fontSize: 15.sp,
                              ),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          }
                          ;
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.sp),
                    child: DefaultTextFormField(
                        controller: phoneController,
                        label: 'Phone number',
                        hintText: '01062647859',
                        keyBoard: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          }
                        }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 48.h,
                    margin: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: DefaultElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            editProfile(
                                userController.text,
                                firstNameController.text,
                                lastNameController.text,
                                emailController.text,
                                passwordController.text,
                                phoneController.text);
                          }
                        },
                        label: 'Update',
                        isValidate: true),
                  ),
                ],
              )),
            );
          },
        ),
      ),
    );
  }

  XFile? image;

  buildProfileImage() {
    return InkWell(
      onTap: () async {
        final ImagePicker _picker = ImagePicker();
        image = await _picker.pickImage(source: ImageSource.gallery);
        setState(() {
          image = XFile(image!.path);
        });
      },
      child: image == null
          ? CircleAvatar(
              radius: 40.sp,
              child: Icon(
                Icons.person,
                size: 33.sp,
              ))
          : CircleAvatar(
              radius: 40.sp,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35.sp),
                  child: Image.file(
                    File(image!.path),
                    fit: BoxFit.fill,
                    width: 80.sp,
                    height: 80.sp,
                  ),
                ),
              ),
            ),
    );
  }

  void editProfile(String userName, String firstName, String lastName,
      String email, String password, String phone) {
    editProfileViewModel.updateProfile(
        userName, firstName, lastName, email, password, phone);
  }
}
