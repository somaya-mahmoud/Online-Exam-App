import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:online_exam_app/app/functions.dart';
import 'package:online_exam_app/app/functions.dart';
import 'package:online_exam_app/app/functions.dart';
import 'package:online_exam_app/app/functions.dart';
import 'package:online_exam_app/app/functions.dart';
import 'base_states.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) logWarning('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) logWarning('onChange -- ${bloc.runtimeType}, $change');

    if (change.nextState is ErrorState) {
      if (kDebugMode) {
        logWarning('Error: ${(change.nextState as ErrorState).errorMessage}');
      }
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) logWarning('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) logWarning('onClose -- ${bloc.runtimeType}');
  }
}
