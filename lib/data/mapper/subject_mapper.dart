import 'package:online_exam_app/data/models/exam_response/SubjectsResponse.dart';
import 'package:online_exam_app/domain/entities/subjects.dart';

class SubjectMapper {
  static List<Subject> subjectEntity(SubjectsResponse response) {
    if (response.subjects == null) return [];
    return response.subjects!
        .map((e) => Subject(id: e.id!, icon: e.icon!, name: e.name!))
        .toList();
  }
}
