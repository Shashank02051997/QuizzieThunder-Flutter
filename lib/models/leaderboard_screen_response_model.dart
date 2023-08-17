class LeaderboardScreenResponseModel {
  LeaderboardScreenResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.allTimeLeaderboard,
    required this.weeklyLeaderboard,
  });

  final int? code;
  final bool? status;
  final String? message;
  final List<Leaderboard>? allTimeLeaderboard;
  final List<Leaderboard>? weeklyLeaderboard;

  factory LeaderboardScreenResponseModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardScreenResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      allTimeLeaderboard: json["all_time_leaderboard"] == null
          ? []
          : List<Leaderboard>.from(json["all_time_leaderboard"]!
              .map((x) => Leaderboard.fromJson(x))),
      weeklyLeaderboard: json["weekly_leaderboard"] == null
          ? []
          : List<Leaderboard>.from(
              json["weekly_leaderboard"]!.map((x) => Leaderboard.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "all_time_leaderboard":
            allTimeLeaderboard?.map((x) => x.toJson()).toList(),
        "weekly_leaderboard":
            weeklyLeaderboard?.map((x) => x.toJson()).toList(),
      };
}

class Leaderboard {
  Leaderboard({
    required this.quizWon,
    required this.id,
    required this.user,
    required this.points,
    required this.quizPlayed,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? quizWon;
  final String? id;
  final User? user;
  final int? points;
  final int? quizPlayed;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Leaderboard.fromJson(Map<String, dynamic> json) {
    return Leaderboard(
      quizWon: json["quizWon"],
      id: json["_id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      points: json["points"],
      quizPlayed: json["quizPlayed"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "quizWon": quizWon,
        "_id": id,
        "user": user?.toJson(),
        "points": points,
        "quizPlayed": quizPlayed,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class User {
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
  });

  final String? id;
  final String? firstname;
  final String? lastname;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
      };
}
