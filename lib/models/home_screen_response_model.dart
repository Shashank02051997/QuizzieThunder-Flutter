import 'all_quiz_response_model.dart';

class HomeScreenResponseModel {
  HomeScreenResponseModel({
    required this.code,
    required this.status,
    required this.quizzes,
    required this.mostPlayedQuiz,
  });

  final int? code;
  final bool? status;
  final List<Quiz>? quizzes;
  final Quiz? mostPlayedQuiz;

  factory HomeScreenResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeScreenResponseModel(
      code: json["code"],
      status: json["status"],
      quizzes: json["quizzes"] == null
          ? []
          : List<Quiz>.from(json["quizzes"]!.map((x) => Quiz.fromJson(x))),
      mostPlayedQuiz: json["most_played_quiz"] == null
          ? null
          : Quiz.fromJson(json["most_played_quiz"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "quizzes": quizzes?.map((x) => x.toJson()).toList(),
        "most_played_quiz": mostPlayedQuiz?.toJson(),
      };
}

class Category {
  Category({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? title;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["_id"],
      title: json["title"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
