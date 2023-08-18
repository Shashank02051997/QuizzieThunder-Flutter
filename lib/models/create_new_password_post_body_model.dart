class CreateNewPasswordPostBodyModel {
  CreateNewPasswordPostBodyModel({
    required this.mobile,
    required this.otp,
    required this.newPassword,
  });

  final String? mobile;
  final String? otp;
  final String? newPassword;

  factory CreateNewPasswordPostBodyModel.fromJson(Map<String, dynamic> json) {
    return CreateNewPasswordPostBodyModel(
      mobile: json["mobile"],
      otp: json["otp"],
      newPassword: json["new_password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "otp": otp,
        "new_password": newPassword,
      };
}
