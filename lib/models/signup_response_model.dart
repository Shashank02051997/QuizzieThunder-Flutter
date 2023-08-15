class SignUpResponseModel {
  SignUpResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final Result? result;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "result": result?.toJson(),
      };
}

class Result {
  Result({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobile,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? firstname;
  final String? lastname;
  final String? email;
  final String? mobile;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      mobile: json["mobile"],
      id: json["_id"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "mobile": mobile,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
