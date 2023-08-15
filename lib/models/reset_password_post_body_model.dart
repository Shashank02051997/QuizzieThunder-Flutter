class ResetPasswordPostBodyModel {
  ResetPasswordPostBodyModel({
    required this.mobile,
    required this.newPassword,
  });

  final String? mobile;
  final String? newPassword;

  factory ResetPasswordPostBodyModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordPostBodyModel(
      mobile: json["mobile"],
      newPassword: json["new_password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "new_password": newPassword,
      };
}
