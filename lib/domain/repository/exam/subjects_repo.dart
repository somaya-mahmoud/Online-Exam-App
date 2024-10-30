import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/entities/subjects.dart';

abstract class SubjectsRepo {
  Future<ApiResult<List<Subject>>> getSubjects();

}
