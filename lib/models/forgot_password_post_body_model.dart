class ForgotPasswordPostBodyModel {
  ForgotPasswordPostBodyModel({
    required this.mobile,
  });

  final String? mobile;

  factory ForgotPasswordPostBodyModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordPostBodyModel(
      mobile: json["mobile"],
    );
  }

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
      };
}
