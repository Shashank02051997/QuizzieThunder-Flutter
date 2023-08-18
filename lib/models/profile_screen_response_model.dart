class ProfileScreenResponseModel {
  ProfileScreenResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.userDetail,
    required this.stats,
    required this.rank,
  });

  final int? code;
  final bool? status;
  final String? message;
  final UserDetail? userDetail;
  final Stats? stats;
  final int? rank;

  factory ProfileScreenResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileScreenResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      userDetail: json["user_detail"] == null
          ? null
          : UserDetail.fromJson(json["user_detail"]),
      stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
      rank: json["rank"],
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "user_detail": userDetail?.toJson(),
        "stats": stats?.toJson(),
        "rank": rank,
      };
}

class Stats {
  Stats({
    required this.quizWon,
    required this.id,
    required this.points,
    required this.quizPlayed,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? quizWon;
  final String? id;
  final int? points;
  final int? quizPlayed;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      quizWon: json["quizWon"],
      id: json["_id"],
      points: json["points"],
      quizPlayed: json["quizPlayed"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "quizWon": quizWon,
        "_id": id,
        "points": points,
        "quizPlayed": quizPlayed,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class UserDetail {
  UserDetail({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.about,
  });

  final String? id;
  final String? firstname;
  final String? lastname;
  final String? about;

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json["_id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      about: json["about"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "about": about,
      };
}
