class ResetPasswordResponseModel {
  ResetPasswordResponseModel({
    required this.code,
    required this.status,
    required this.message,
  });

  final int? code;
  final bool? status;
  final String? message;

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
