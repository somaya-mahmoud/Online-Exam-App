class ExamsEntity {
  ExamsEntity({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
  });

  String id;
  String title;
  num duration;
  String subject;
  num numberOfQuestions;
  bool active;
}
