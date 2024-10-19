import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/presentation/resources/colors_manager.dart';

class DefaultElevatedButton extends StatelessWidget {
  DefaultElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isValidate = true, // Defaults to true
  });

  final VoidCallback? onPressed;
  final String label;
  final bool isValidate; // This controls whether the button is enabled or disabled

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isValidate ? onPressed : null, // Disable onPressed when not valid
      style: ElevatedButton.styleFrom(
        backgroundColor: isValidate
            ? ColorsManager.blueBase // Active color when form is valid
            : ColorsManager.black30, // Disabled color when form is invalid
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h),
      ),
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: ColorsManager.white),
      ),
    );
  }
}
