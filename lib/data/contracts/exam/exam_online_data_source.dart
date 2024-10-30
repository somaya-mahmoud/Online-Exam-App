import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/entities/exams_entity.dart';
import 'package:online_exam_app/domain/entities/subjects.dart';

abstract class ExamOnlineOnlineSource {
  Future<ApiResult<List<Subject>>> getSubjects();
  Future<ApiResult<List<ExamsEntity>>> getExams();
}
