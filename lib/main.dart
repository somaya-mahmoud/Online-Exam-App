import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/di/di.dart';
import 'package:online_exam_app/presentation/resources/language_manager.dart';
import 'app/app.dart';
import 'data/api/abb_bloc_observer.dart';

late final WidgetsBinding engine;
void main() async {
  engine = WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const OnlineExamApp());
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: AppLanguages.locals,
      path: AppLanguages.translationsPath,
      fallbackLocale: AppLanguages.fallBackLocal,
      startLocale: AppLanguages.startLocal,
      useOnlyLangCode: true,
      saveLocale: true,
      child: const OnlineExamApp(),
    ),
  );
}
