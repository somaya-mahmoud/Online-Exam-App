import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/base/base_states.dart';
import '../resources/assets_manger.dart';
import 'base_widgets.dart';

Widget baseBuilder(BuildContext context, BaseState state, Widget child) {
  if (state is LoadingState) {
    return BaseWidgets.buildItemsColumn([
      BaseWidgets.buildAnimatedImage(LottieAssets.loading),
    ]);  } else if (state is SuccessState) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text(state.message)),
    //   );
    // });

    return BaseWidgets.buildItemsColumn([
      BaseWidgets.buildAnimatedImage(LottieAssets.success,false),
    ]);
  } else if (state is ErrorState) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage)),
      );
    });
  }

  return child;
}
