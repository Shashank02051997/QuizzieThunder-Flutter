class UserProfileResponseModel {
  UserProfileResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.user,
  });

  final int? code;
  final bool? status;
  final String? message;
  final User? user;

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return UserProfileResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "user": user?.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobile,
    required this.role,
    required this.about,
    required this.isMobileNumberVerified,
    required this.isEmailVerified,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? mobile;
  final String? role;
  final String? about;
  final bool? isMobileNumberVerified;
  final bool? isEmailVerified;
  final bool? isBlocked;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      mobile: json["mobile"],
      role: json["role"],
      about: json["about"],
      isMobileNumberVerified: json["isMobileNumberVerified"],
      isEmailVerified: json["isEmailVerified"],
      isBlocked: json["isBlocked"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "mobile": mobile,
        "role": role,
        "about": about,
        "isMobileNumberVerified": isMobileNumberVerified,
        "isEmailVerified": isEmailVerified,
        "isBlocked": isBlocked,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
