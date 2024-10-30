import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/screens/Exam/exam/questions_widget.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ExamWidget(),
    );
  }
}
