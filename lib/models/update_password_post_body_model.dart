class UpdatePasswordPostBodyModel {
  UpdatePasswordPostBodyModel({
    required this.newPassword,
  });

  final String? newPassword;

  factory UpdatePasswordPostBodyModel.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordPostBodyModel(
      newPassword: json["new_password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "new_password": newPassword,
      };
}
