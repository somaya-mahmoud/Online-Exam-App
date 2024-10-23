import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';


typedef Validator = String? Function(String?);

class DefaultTextFormField extends StatefulWidget {
  final String label;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyBoard;
  final bool isObscure;
  final TextEditingController controller;
  final Validator validator;
  final Color cursorColor;
  final void Function(dynamic _)? onChanged;

  const DefaultTextFormField(
      {required this.label,
        required this.hintText,
        required this.controller,
        required this.validator,
        this.cursorColor = ColorsManager.grey,
        this.keyBoard = TextInputType.text,
        this.suffixIcon,
        this.isObscure = false,
        super.key,  this.onChanged});

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool hidden = widget.isObscure;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   const EdgeInsets.all(AppSize.s10),
      child: TextFormField(

        onChanged: widget.onChanged,
        decoration: InputDecoration(

          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(widget.label,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall),
          hintText: widget.hintText ,
          hintStyle:Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorsManager.placeHolder),
          suffixIcon: widget.isObscure
              ? IconButton(
            onPressed: () {
              setState(
                    () {
                  hidden = !hidden;
                },
              );
            },
            iconSize: AppSize.s24,
            splashRadius: AppSize.s1,
            isSelected: !hidden,
            color: widget.cursorColor,
            selectedIcon: const Icon(CupertinoIcons.eye),
            icon: const Icon(CupertinoIcons.eye_slash),
          )
              : null,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(width: 1.sp, color:  ColorsManager.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(width: 2.sp, color: ColorsManager.grey)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(width: 2.sp,color: ColorsManager.error)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(width: 1.sp,color: ColorsManager.error)),

        ),
        cursorColor:ColorsManager.blueBase,
        style: Theme.of(context).textTheme.bodyMedium,
        keyboardType: widget.keyBoard,
        obscureText:  hidden,
        controller: widget.controller,
        validator: widget.validator,
      ),
    );
  }
}