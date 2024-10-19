import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/di/di.dart';
import 'data/api/api_manager.dart';
import 'online_exam_app.dart';
import 'data/api/abb_bloc_observer.dart';

void main() {
  ApiManager();
  configureDependencies();
  Bloc.observer = MyBlocObserver();

  runApp(const OnlineExamApp());
}
