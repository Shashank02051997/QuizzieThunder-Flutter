class UpdateProfileResponseModel {
  UpdateProfileResponseModel({
    required this.code,
    required this.status,
    required this.updatedUser,
  });

  final int? code;
  final bool? status;
  final UpdatedUser? updatedUser;

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponseModel(
      code: json["code"],
      status: json["status"],
      updatedUser: json["updatedUser"] == null
          ? null
          : UpdatedUser.fromJson(json["updatedUser"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "updatedUser": updatedUser?.toJson(),
      };
}

class UpdatedUser {
  UpdatedUser({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobile,
    required this.role,
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
  final bool? isMobileNumberVerified;
  final bool? isEmailVerified;
  final bool? isBlocked;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory UpdatedUser.fromJson(Map<String, dynamic> json) {
    return UpdatedUser(
      id: json["_id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      mobile: json["mobile"],
      role: json["role"],
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
        "isMobileNumberVerified": isMobileNumberVerified,
        "isEmailVerified": isEmailVerified,
        "isBlocked": isBlocked,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
