import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api_excute.dart';
import 'package:online_exam_app/data/api/api_manager.dart';
import 'package:online_exam_app/data/contracts/exam/exam_online_data_source.dart';
import 'package:online_exam_app/data/models/exam_response/SubjectsResponse.dart';
import 'package:online_exam_app/domain/common/ApiResult.dart';

@Injectable(as: ExamOnlineOnlineSource)
class ExamOnlineDataSourceImpl implements ExamOnlineOnlineSource {
  late final ApiManager apiManager;
  ExamOnlineDataSourceImpl(this.apiManager);

  @override
  Future<ApiResult<Subjects>>? getSubjects(String token) {
    return executeApi<Subjects>(() async {
   return await apiManager.getSubjects(token);
    });
  }

}
