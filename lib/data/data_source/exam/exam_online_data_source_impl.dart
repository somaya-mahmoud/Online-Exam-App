import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api_excute.dart';
import 'package:online_exam_app/data/api/api_manager.dart';
import 'package:online_exam_app/data/contracts/exam/exam_online_data_source.dart';
import 'package:online_exam_app/data/mapper/exams_mapper.dart';
import 'package:online_exam_app/data/mapper/subject_mapper.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/entities/exams_entity.dart';
import 'package:online_exam_app/domain/entities/subjects.dart';

@Injectable(as: ExamOnlineOnlineSource)
class ExamOnlineDataSourceImpl implements ExamOnlineOnlineSource {
  late final ApiManager apiManager;
  ExamOnlineDataSourceImpl(this.apiManager);

  @override
  Future<ApiResult<List<Subject>>> getSubjects() {
    return executeApi(() async {
      var response = await apiManager.getSubjects();
      return SubjectMapper.subjectEntity(response);
    });
  }

  @override
  Future<ApiResult<List<ExamsEntity>>> getExams() {
    return executeApi(() async {
      var examsResponse = await apiManager.getExams();
      return ExamsMapper.examsEntity(examsResponse);
    });
  }
}
