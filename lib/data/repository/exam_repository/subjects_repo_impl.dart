import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/contracts/exam/exam_online_data_source.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/entities/subjects.dart';
import 'package:online_exam_app/domain/repository/exam/subjects_repo.dart';

@Injectable(as: SubjectsRepo)
class SubjectsRepoImpl implements SubjectsRepo {
  ExamOnlineOnlineSource examOnlineOnlineSource;
  SubjectsRepoImpl(this.examOnlineOnlineSource);

  @override
  Future<ApiResult<List<Subject>>> getSubjects() async {
    return await examOnlineOnlineSource.getSubjects();
  }
}
