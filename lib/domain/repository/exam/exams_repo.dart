
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/entities/exams_entity.dart';

 abstract class ExamsRepo{
   Future<ApiResult<List<ExamsEntity>>> getExams();
 }