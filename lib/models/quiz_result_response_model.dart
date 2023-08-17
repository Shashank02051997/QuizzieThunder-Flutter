class QuizResultResponseModel {
  QuizResultResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.newQuizResult,
  });

  final int? code;
  final bool? status;
  final String? message;
  final NewQuizResult? newQuizResult;

  factory QuizResultResponseModel.fromJson(Map<String, dynamic> json) {
    return QuizResultResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      newQuizResult: json["newQuizResult"] == null
          ? null
          : NewQuizResult.fromJson(json["newQuizResult"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "newQuizResult": newQuizResult?.toJson(),
      };
}

class NewQuizResult {
  NewQuizResult({
    required this.user,
    required this.points,
    required this.quizPlayed,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? user;
  final int? points;
  final int? quizPlayed;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory NewQuizResult.fromJson(Map<String, dynamic> json) {
    return NewQuizResult(
      user: json["user"],
      points: json["points"],
      quizPlayed: json["quizPlayed"],
      id: json["_id"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "user": user,
        "points": points,
        "quizPlayed": quizPlayed,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
