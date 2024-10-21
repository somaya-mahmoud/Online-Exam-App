import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/presentation/resources/color_manager.dart';

typedef Validator = String? Function(String?);

class DefaultTextFormField extends StatefulWidget {
  final String label;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyBoard;
  final bool isPassword;
  final TextEditingController controller;
  final Validator validator;
  final Widget? textButton;

  const DefaultTextFormField(
      {required this.label,
      required this.hintText,
      required this.controller,
      required this.validator,
      this.keyBoard = TextInputType.text,
      this.suffixIcon,
      this.textButton,
      this.isPassword = false,
      super.key});

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label:
              Text(widget.label, style: Theme.of(context).textTheme.labelSmall),
          hintText: widget.hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: ColorsManager.placeHolder),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () => setState(() => isObscure = !isObscure),
                  icon: isObscure
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined))
              : widget.textButton,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(width: 1.sp, color: ColorsManager.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(width: 2.sp, color: ColorsManager.grey)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(width: 2.sp, color: ColorsManager.error)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(width: 1.sp, color: ColorsManager.error)),
        ),
        cursorColor: ColorsManager.blueBase,
        style: Theme.of(context).textTheme.bodyMedium,
        keyboardType: widget.keyBoard,
        obscureText: isObscure,
        controller: widget.controller,
        validator: widget.validator,
      ),
    );
  }
}
