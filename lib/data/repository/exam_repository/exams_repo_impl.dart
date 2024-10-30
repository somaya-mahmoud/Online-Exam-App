import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/contracts/exam/exam_online_data_source.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/entities/exams_entity.dart';
import 'package:online_exam_app/domain/repository/exam/exams_repo.dart';

@Injectable(as: ExamsRepo)
class ExamsRepoImpl implements ExamsRepo {
  ExamOnlineOnlineSource examOnlineOnlineSource;
  ExamsRepoImpl(this.examOnlineOnlineSource);
  @override
  Future<ApiResult<List<ExamsEntity>>> getExams() async {
    return await examOnlineOnlineSource.getExams();
  }
}
