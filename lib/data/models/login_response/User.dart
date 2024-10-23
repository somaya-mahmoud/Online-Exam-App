/// username : "elday"
/// firstName : "abdalla"
/// lastName : "Tech"
/// email : "xdaly@gmail.com"
/// phone : "01094155711"
/// role : "user"
/// isVerified : false
/// _id : "67168f85b0d25f89fe98da5a"
/// createdAt : "2024-10-21T17:29:41.201Z"

class User {
  User({
      this.username, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.role, 
      this.isVerified, 
      this.id, 
      this.createdAt,});

  User.fromJson(dynamic json) {
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    id = json['_id'];
    createdAt = json['createdAt'];
  }
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  String? id;
  String? createdAt;
User copyWith({  String? username,
  String? firstName,
  String? lastName,
  String? email,
  String? phone,
  String? role,
  bool? isVerified,
  String? id,
  String? createdAt,
}) => User(  username: username ?? this.username,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  role: role ?? this.role,
  isVerified: isVerified ?? this.isVerified,
  id: id ?? this.id,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    return map;
  }

}