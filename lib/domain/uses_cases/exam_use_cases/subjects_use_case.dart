
  import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/contracts/exam/exam_online_data_source.dart';
import 'package:online_exam_app/data/models/exam_response/SubjectsResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';
import 'package:online_exam_app/domain/repository/exam/subjects_repo.dart';

@injectable
  class GetSubjectsUseCase{
  SubjectsRepo subjectsRepo;
  GetSubjectsUseCase(this.subjectsRepo);

  Future<ApiResult<List<Subjects>>>? invoke(String token){
    return subjectsRepo.getSubjects(token);
  }

  }