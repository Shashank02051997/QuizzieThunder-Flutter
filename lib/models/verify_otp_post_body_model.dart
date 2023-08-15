class VerifyOtpPostBodyModel {
  VerifyOtpPostBodyModel({
    required this.mobile,
    required this.otp,
  });

  final String? mobile;
  final String? otp;

  factory VerifyOtpPostBodyModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpPostBodyModel(
      mobile: json["mobile"],
      otp: json["otp"],
    );
  }

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "otp": otp,
      };
}
