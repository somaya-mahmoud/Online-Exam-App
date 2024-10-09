import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theming/colors_manager.dart';

class DefaultElevatedButton extends StatelessWidget {
   DefaultElevatedButton({super.key, required this.onPressed, required this.label,required this.isValidate});

  final VoidCallback onPressed;
  final String label;
   bool isValidate=true;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(backgroundColor:isValidate?ColorsManager.blueBase:ColorsManager.black30,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorsManager.white),
        ));
  }
}
