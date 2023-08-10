class SignInResponseModel {
  SignInResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.result,
  });

  final int? code;
  final bool? status;
  final String? message;
  final Result? result;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
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
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobile,
    required this.token,
  });

  final String? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? mobile;
  final String? token;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json["_id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      mobile: json["mobile"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "mobile": mobile,
        "token": token,
      };
}
