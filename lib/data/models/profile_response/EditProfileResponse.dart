/// message : "success"
/// user : {"_id":"6707b79ae77d68595a292305","username":"Somayaa","firstName":"Mahmoud","lastName":"Tech","email":"somayamahmoud30@gmail.com","phone":"01062674717","role":"user","password":"$2b$08$EbYAxp4VCuMdSyMNSfvJV.p1vWvXM9sZakAYrWDGZnE746zPJ7/ka","isVerified":false,"createdAt":"2024-10-10T11:16:42.170Z"}

class EditProfileResponse {
  EditProfileResponse({
    String? message,
    User? user,
  }) {
    _message = message;
    _user = user;
  }

  EditProfileResponse.fromJson(dynamic json) {
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _message;
  User? _user;
  EditProfileResponse copyWith({
    String? message,
    User? user,
  }) =>
      EditProfileResponse(
        message: message ?? _message,
        user: user ?? _user,
      );
  String? get message => _message;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}

/// _id : "6707b79ae77d68595a292305"
/// username : "Somayaa"
/// firstName : "Mahmoud"
/// lastName : "Tech"
/// email : "somayamahmoud30@gmail.com"
/// phone : "01062674717"
/// role : "user"
/// password : "$2b$08$EbYAxp4VCuMdSyMNSfvJV.p1vWvXM9sZakAYrWDGZnE746zPJ7/ka"
/// isVerified : false
/// createdAt : "2024-10-10T11:16:42.170Z"

class User {
  User({
    String? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? role,
    String? password,
    bool? isVerified,
    String? createdAt,
  }) {
    _id = id;
    _username = username;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _role = role;
    _password = password;
    _isVerified = isVerified;
    _createdAt = createdAt;
  }

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _username = json['username'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _phone = json['phone'];
    _role = json['role'];
    _password = json['password'];
    _isVerified = json['isVerified'];
    _createdAt = json['createdAt'];
  }
  String? _id;
  String? _username;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _role;
  String? _password;
  bool? _isVerified;
  String? _createdAt;
  User copyWith({
    String? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? role,
    String? password,
    bool? isVerified,
    String? createdAt,
  }) =>
      User(
        id: id ?? _id,
        username: username ?? _username,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        phone: phone ?? _phone,
        role: role ?? _role,
        password: password ?? _password,
        isVerified: isVerified ?? _isVerified,
        createdAt: createdAt ?? _createdAt,
      );
  String? get id => _id;
  String? get username => _username;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;
  String? get role => _role;
  String? get password => _password;
  bool? get isVerified => _isVerified;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['username'] = _username;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['role'] = _role;
    map['password'] = _password;
    map['isVerified'] = _isVerified;
    map['createdAt'] = _createdAt;
    return map;
  }
}
