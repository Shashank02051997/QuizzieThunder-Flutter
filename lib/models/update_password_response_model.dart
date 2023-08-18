class UpdatePasswordResponseModel {
  UpdatePasswordResponseModel({
    required this.code,
    required this.status,
    required this.message,
  });

  final int? code;
  final bool? status;
  final String? message;

  factory UpdatePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordResponseModel(
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
