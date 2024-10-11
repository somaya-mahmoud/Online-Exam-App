import 'package:flutter/material.dart';
import 'package:online_exam_app/di/di.dart';
import 'online_exam_app.dart';

void main() {
  configureDependencies();

  runApp(const OnlineExamApp());
}



