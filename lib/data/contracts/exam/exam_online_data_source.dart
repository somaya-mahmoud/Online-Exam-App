

 import 'package:online_exam_app/data/models/exam_response/SubjectsResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';

abstract class ExamOnlineOnlineSource {
  Future<ApiResult<Subjects>>? getSubjects(String token){}
 }