class UpdateProfilePostBodyModel {
  UpdateProfilePostBodyModel({
    required this.firstname,
    required this.lastname,
    required this.about,
  });

  final String? firstname;
  final String? lastname;
  final String? about;

  factory UpdateProfilePostBodyModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfilePostBodyModel(
      firstname: json["firstname"],
      lastname: json["lastname"],
      about: json["about"],
    );
  }

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "about": about,
      };
}
