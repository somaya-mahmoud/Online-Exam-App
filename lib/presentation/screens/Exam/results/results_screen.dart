import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/screens/Exam/results/results_widget.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResultsWidget(),
    );
  }
}
