class ForgotPasswordResponseModel {
  ForgotPasswordResponseModel(
      {required this.code, required this.status, required this.message});

  final int? code;
  final bool? status;
  final String? message;

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponseModel(
        code: json["code"], status: json["status"], message: json["message"]);
  }

  Map<String, dynamic> toJson() =>
      {"code": code, "status": status, "message": message};
}
