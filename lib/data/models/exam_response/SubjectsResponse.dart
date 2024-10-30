/// message : "success"
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// subjects : [{"_id":"670037f6728c92b7fdf434fc","name":"HTML","icon":"https://exam.elevateegy.com/uploads/categories/670037f6728c92b7fdf434fa-html-language.png","createdAt":"2024-10-04T18:46:14.281Z"},{"_id":"670038f7728c92b7fdf43501","name":"CSS","icon":"https://exam.elevateegy.com/uploads/categories/670038f7728c92b7fdf434ff-css.png","createdAt":"2024-10-04T18:50:31.606Z"},{"_id":"670039c3728c92b7fdf43506","name":"Javascript","icon":"https://exam.elevateegy.com/uploads/categories/670039c3728c92b7fdf43504-javascript.png","createdAt":"2024-10-04T18:53:55.992Z"},{"_id":"67003a9a728c92b7fdf4350a","name":"Angular","icon":"https://exam.elevateegy.com/uploads/categories/67003a9a728c92b7fdf43508-angularjs.png","createdAt":"2024-10-04T18:57:30.499Z"},{"_id":"67003aad728c92b7fdf4350e","name":"React","icon":"https://exam.elevateegy.com/uploads/categories/67003aad728c92b7fdf4350c-react.png","createdAt":"2024-10-04T18:57:49.959Z"},{"_id":"67003b69728c92b7fdf43512","name":"Flutter","icon":"https://exam.elevateegy.com/uploads/categories/67003b69728c92b7fdf43510-Flutter.png","createdAt":"2024-10-04T19:00:57.863Z"}]

class SubjectsResponse {
  SubjectsResponse({
    String? message,
    Metadata? metadata,
    List<Subjects>? subjects,
  }) {
    _message = message;
    _metadata = metadata;
    _subjects = subjects;
  }

  SubjectsResponse.fromJson(dynamic json) {
    _message = json['message'];
    _metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['subjects'] != null) {
      _subjects = [];
      json['subjects'].forEach((v) {
        _subjects?.add(Subjects.fromJson(v));
      });
    }
  }
  String? _message;
  Metadata? _metadata;
  List<Subjects>? _subjects;
  SubjectsResponse copyWith({
    String? message,
    Metadata? metadata,
    List<Subjects>? subjects,
  }) =>
      SubjectsResponse(
        message: message ?? _message,
        metadata: metadata ?? _metadata,
        subjects: subjects ?? _subjects,
      );
  String? get message => _message;
  Metadata? get metadata => _metadata;
  List<Subjects>? get subjects => _subjects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_metadata != null) {
      map['metadata'] = _metadata?.toJson();
    }
    if (_subjects != null) {
      map['subjects'] = _subjects?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "670037f6728c92b7fdf434fc"
/// name : "HTML"
/// icon : "https://exam.elevateegy.com/uploads/categories/670037f6728c92b7fdf434fa-html-language.png"
/// createdAt : "2024-10-04T18:46:14.281Z"

class Subjects {
  Subjects({
    String? id,
    String? name,
    String? icon,
    String? createdAt,
  }) {
    _id = id;
    _name = name;
    _icon = icon;
    _createdAt = createdAt;
  }

  Subjects.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _icon = json['icon'];
    _createdAt = json['createdAt'];
  }
  String? _id;
  String? _name;
  String? _icon;
  String? _createdAt;
  Subjects copyWith({
    String? id,
    String? name,
    String? icon,
    String? createdAt,
  }) =>
      Subjects(
        id: id ?? _id,
        name: name ?? _name,
        icon: icon ?? _icon,
        createdAt: createdAt ?? _createdAt,
      );
  String? get id => _id;
  String? get name => _name;
  String? get icon => _icon;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['icon'] = _icon;
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
