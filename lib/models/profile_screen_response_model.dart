class ProfileScreenResponseModel {
  ProfileScreenResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.userDetail,
    required this.stats,
  });

  final int? code;
  final bool? status;
  final String? message;
  final UserDetail? userDetail;
  final Stats? stats;

  factory ProfileScreenResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileScreenResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      userDetail: json["user_detail"] == null
          ? null
          : UserDetail.fromJson(json["user_detail"]),
      stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "user_detail": userDetail?.toJson(),
        "stats": stats?.toJson(),
      };
}

class Stats {
  Stats({
    required this.quizWon,
    required this.id,
    required this.points,
    required this.totalQuizPlayed,
    required this.rank,
    required this.successRate,
    required this.averagePointsPerQuiz,
    required this.quizParticipationRate,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? quizWon;
  final String? id;
  final int? points;
  final int? totalQuizPlayed;
  final int? rank;
  final int? successRate;
  final double? averagePointsPerQuiz;
  final double? quizParticipationRate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      quizWon: json["quiz_won"],
      id: json["_id"],
      points: json["points"],
      totalQuizPlayed: json["total_quiz_played"],
      rank: json["rank"],
      successRate: json["success_rate"],
      averagePointsPerQuiz: json["average_points_per_quiz"]?.toDouble(),
      quizParticipationRate: json["quiz_participation_rate"]?.toDouble(),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "quiz_won": quizWon,
        "_id": id,
        "points": points,
        "total_quiz_played": totalQuizPlayed,
        "rank": rank,
        "success_rate": successRate,
        "average_points_per_quiz": averagePointsPerQuiz,
        "quiz_participation_rate": quizParticipationRate,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class UserDetail {
  UserDetail({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobile,
    required this.about,
    required this.role,
    required this.isMobileNumberVerified,
    required this.isEmailVerified,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.profilePic,
  });

  final String? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? mobile;
  final String? about;
  final String? role;
  final bool? isMobileNumberVerified;
  final bool? isEmailVerified;
  final bool? isBlocked;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? profilePic;

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json["_id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"],
      mobile: json["mobile"],
      about: json["about"],
      role: json["role"],
      isMobileNumberVerified: json["isMobileNumberVerified"],
      isEmailVerified: json["isEmailVerified"],
      isBlocked: json["isBlocked"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      profilePic: json["profilePic"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "mobile": mobile,
        "about": about,
        "role": role,
        "isMobileNumberVerified": isMobileNumberVerified,
        "isEmailVerified": isEmailVerified,
        "isBlocked": isBlocked,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "profilePic": profilePic,
      };
}
