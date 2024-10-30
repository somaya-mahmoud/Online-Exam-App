import 'package:online_exam_app/data/models/exam_response/ExamsResponse.dart';
import 'package:online_exam_app/domain/entities/exams_entity.dart';

class ExamsMapper {
  static List<ExamsEntity> examsEntity(ExamsResponse examsResponse) {
    if (examsResponse.exams == null) return [];
    return examsResponse.exams!
        .map((exams) => ExamsEntity(
            id: exams.id!,
            title: exams.title!,
            duration: exams.duration!,
            subject: exams.subject!,
            numberOfQuestions: exams.numberOfQuestions!,
            active: exams.active!))
        .toList();
  }
}
