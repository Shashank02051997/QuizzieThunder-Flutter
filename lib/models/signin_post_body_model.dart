class SignInPostBodyModel {
  SignInPostBodyModel({
    required this.mobile,
    required this.password,
  });

  final String? mobile;
  final String? password;

  factory SignInPostBodyModel.fromJson(Map<String, dynamic> json) {
    return SignInPostBodyModel(
      mobile: json["mobile"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "password": password,
      };
}
