class ApiErrorResponseModel {
  ApiErrorResponseModel({
    required this.message,
    required this.status,
  });

  final String? message;
  final int? status;

  factory ApiErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponseModel(
      message: json["message"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
