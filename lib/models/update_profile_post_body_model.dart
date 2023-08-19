class UpdateProfilePostBodyModel {
  UpdateProfilePostBodyModel({
    required this.firstname,
    required this.lastname,
    required this.about,
    required this.profilePic,
  });

  final String? firstname;
  final String? lastname;
  final String? about;
  final String? profilePic;

  factory UpdateProfilePostBodyModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfilePostBodyModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
        about: json["about"],
        profilePic: json["profile_pic"]);
  }

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "about": about,
        "profile_pic": profilePic,
      };
}
