import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/entities/exams_entity.dart';
import 'package:online_exam_app/domain/entities/subjects.dart';
import 'package:online_exam_app/domain/repository/exam/subjects_repo.dart';

@injectable
class GetSubjectsUseCase {
  SubjectsRepo subjectsRepo;
  GetSubjectsUseCase(this.subjectsRepo);
  Future<ApiResult<List<Subject>>> call()  {
    return  subjectsRepo.getSubjects();
  }
}
