import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

AppBar buildMainAppBar({
  required BuildContext context,
  Widget? title,
  Color color = ColorsManager.transparent,
  bool canChangeLanguage = false,
  Function()? onChangeLanguage,
  List<Widget>? actions,
}) {
  return AppBar(
    toolbarHeight: AppSize.s70,
    backgroundColor: color,
    title: title,
    scrolledUnderElevation: AppSize.s0,
    leadingWidth: AppSize.s25,
    // bottom: PreferredSize(
    //   preferredSize: const Size.fromHeight(AppSize.s1_4),
    //   child: Container(
    //     color: ColorsManager.black30,
    //     height: AppSize.s1_4,
    //   ),
    // ),
    // leading: canChangeLanguage
    //     ? IconButton(
    //   icon: const Icon(CupertinoIcons.globe),
    //   onPressed: () {
    //     AppLanguages.toggleLocal(context);
    //     if (onChangeLanguage != null) {
    //       WidgetsBinding.instance.addPostFrameCallback(
    //             (_) {
    //           onChangeLanguage();
    //         },
    //       );
    //     }
    //   },
    // )
    //     : null,

    leading:  Padding(
      padding: const EdgeInsets.all( 8.0),
      child:GestureDetector(
          onTap: () {
            Navigator.pop(context);

          },
          child: const Icon(Icons.arrow_back_ios,))
    ),
    actions: actions,
    elevation: AppSize.s0,
    shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
  );
}