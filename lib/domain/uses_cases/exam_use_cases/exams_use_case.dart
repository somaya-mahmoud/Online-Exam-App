
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/entities/exams_entity.dart';
import 'package:online_exam_app/domain/repository/exam/exams_repo.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';


@injectable
 class GetExamsUseCase {
  ExamsRepo examsRepo;
  GetExamsUseCase(this.examsRepo);
  Future<ApiResult<List<ExamsEntity>>> call()  {
    return  examsRepo.getExams();
  }
 }