/// message : "success"
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// exams : [{"_id":"6700707030a3c3c1944a9c5d","title":"JavaScript Quiz","duration":20,"subject":"670039c3728c92b7fdf43506","numberOfQuestions":25,"active":true,"createdAt":"2024-10-04T22:47:12.913Z"},{"_id":"6700708d30a3c3c1944a9c60","title":"CSS Quiz","duration":20,"subject":"670038f7728c92b7fdf43501","numberOfQuestions":25,"active":true,"createdAt":"2024-10-04T22:47:41.364Z"},{"_id":"670070a830a3c3c1944a9c63","title":"HTML Quiz","duration":25,"subject":"670037f6728c92b7fdf434fc","numberOfQuestions":40,"active":true,"createdAt":"2024-10-04T22:48:08.842Z"},{"_id":"670070cc30a3c3c1944a9c66","title":"React Quiz","duration":25,"subject":"67003aad728c92b7fdf4350e","numberOfQuestions":25,"active":true,"createdAt":"2024-10-04T22:48:44.245Z"}]

class ExamsResponse {
  ExamsResponse({
    String? message,
    Metadata? metadata,
    List<Exams>? exams,
  }) {
    _message = message;
    _metadata = metadata;
    _exams = exams;
  }

  ExamsResponse.fromJson(dynamic json) {
    _message = json['message'];
    _metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['exams'] != null) {
      _exams = [];
      json['exams'].forEach((v) {
        _exams?.add(Exams.fromJson(v));
      });
    }
  }
  String? _message;
  Metadata? _metadata;
  List<Exams>? _exams;
  ExamsResponse copyWith({
    String? message,
    Metadata? metadata,
    List<Exams>? exams,
  }) =>
      ExamsResponse(
        message: message ?? _message,
        metadata: metadata ?? _metadata,
        exams: exams ?? _exams,
      );
  String? get message => _message;
  Metadata? get metadata => _metadata;
  List<Exams>? get exams => _exams;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_metadata != null) {
      map['metadata'] = _metadata?.toJson();
    }
    if (_exams != null) {
      map['exams'] = _exams?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "6700707030a3c3c1944a9c5d"
/// title : "JavaScript Quiz"
/// duration : 20
/// subject : "670039c3728c92b7fdf43506"
/// numberOfQuestions : 25
/// active : true
/// createdAt : "2024-10-04T22:47:12.913Z"

class Exams {
  Exams({
    String? id,
    String? title,
    num? duration,
    String? subject,
    num? numberOfQuestions,
    bool? active,
    String? createdAt,
  }) {
    _id = id;
    _title = title;
    _duration = duration;
    _subject = subject;
    _numberOfQuestions = numberOfQuestions;
    _active = active;
    _createdAt = createdAt;
  }

  Exams.fromJson(dynamic json) {
    _id = json['_id'];
    _title = json['title'];
    _duration = json['duration'];
    _subject = json['subject'];
    _numberOfQuestions = json['numberOfQuestions'];
    _active = json['active'];
    _createdAt = json['createdAt'];
  }
  String? _id;
  String? _title;
  num? _duration;
  String? _subject;
  num? _numberOfQuestions;
  bool? _active;
  String? _createdAt;
  Exams copyWith({
    String? id,
    String? title,
    num? duration,
    String? subject,
    num? numberOfQuestions,
    bool? active,
    String? createdAt,
  }) =>
      Exams(
        id: id ?? _id,
        title: title ?? _title,
        duration: duration ?? _duration,
        subject: subject ?? _subject,
        numberOfQuestions: numberOfQuestions ?? _numberOfQuestions,
        active: active ?? _active,
        createdAt: createdAt ?? _createdAt,
      );
  String? get id => _id;
  String? get title => _title;
  num? get duration => _duration;
  String? get subject => _subject;
  num? get numberOfQuestions => _numberOfQuestions;
  bool? get active => _active;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title'] = _title;
    map['duration'] = _duration;
    map['subject'] = _subject;
    map['numberOfQuestions'] = _numberOfQuestions;
    map['active'] = _active;
    map['createdAt'] = _createdAt;
    return map;
  }
}

/// currentPage : 1
/// numberOfPages : 1
/// limit : 40

class Metadata {
  Metadata({
    num? currentPage,
    num? numberOfPages,
    num? limit,
  }) {
    _currentPage = currentPage;
    _numberOfPages = numberOfPages;
    _limit = limit;
  }

  Metadata.fromJson(dynamic json) {
    _currentPage = json['currentPage'];
    _numberOfPages = json['numberOfPages'];
    _limit = json['limit'];
  }
  num? _currentPage;
  num? _numberOfPages;
  num? _limit;
  Metadata copyWith({
    num? currentPage,
    num? numberOfPages,
    num? limit,
  }) =>
      Metadata(
        currentPage: currentPage ?? _currentPage,
        numberOfPages: numberOfPages ?? _numberOfPages,
        limit: limit ?? _limit,
      );
  num? get currentPage => _currentPage;
  num? get numberOfPages => _numberOfPages;
  num? get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = _currentPage;
    map['numberOfPages'] = _numberOfPages;
    map['limit'] = _limit;
    return map;
  }
}
