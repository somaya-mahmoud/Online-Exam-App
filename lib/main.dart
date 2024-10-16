import 'package:flutter/material.dart';
import 'package:online_exam_app/di/di.dart';
import 'data/api/api_manager.dart';
import 'online_exam_app.dart';

void main() {
  ApiManager();
  configureDependencies();

  runApp(const OnlineExamApp());
}
