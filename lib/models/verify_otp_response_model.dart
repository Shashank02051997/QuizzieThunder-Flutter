class VerifyOtpResponseModel {
  VerifyOtpResponseModel({
    required this.code,
    required this.status,
    required this.message,
  });

  final int? code;
  final bool? status;
  final String? message;

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponseModel(
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
