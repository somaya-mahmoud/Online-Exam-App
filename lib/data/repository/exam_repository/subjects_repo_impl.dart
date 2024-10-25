import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/contracts/exam/exam_online_data_source.dart';
import 'package:online_exam_app/data/models/exam_response/SubjectsResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/repository/exam/subjects_repo.dart';

@Injectable(as: SubjectsRepo)
class SubjectsRepoImpl implements SubjectsRepo {
  ExamOnlineOnlineSource examOnlineOnlineSource;
  SubjectsRepoImpl(this.examOnlineOnlineSource);

  @override
  Future<ApiResult<List<Subjects>>>? getSubjects(String token) {
  examOnlineOnlineSource.getSubjects(token);
  }





}
