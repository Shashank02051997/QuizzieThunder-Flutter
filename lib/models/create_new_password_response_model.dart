class CreateNewPasswordResponseModel {
  CreateNewPasswordResponseModel({
    required this.code,
    required this.status,
    required this.message,
  });

  final int? code;
  final bool? status;
  final String? message;

  factory CreateNewPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return CreateNewPasswordResponseModel(
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
