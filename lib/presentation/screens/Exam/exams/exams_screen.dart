

 import 'package:flutter/material.dart';
import 'package:online_exam_app/presentation/screens/Exam/exams/exams_widget.dart';

class ExamsScreen extends StatelessWidget {
   const ExamsScreen({super.key});

   @override
   Widget build(BuildContext context) {
     return  Scaffold(
       body: ExamsWidget(),
     );
   }
 }
