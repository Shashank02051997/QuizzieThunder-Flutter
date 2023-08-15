class AllQuizResponseModel {
  AllQuizResponseModel({
    required this.code,
    required this.status,
    required this.count,
    required this.quizzes,
  });

  final int? code;
  final bool? status;
  final int? count;
  final List<Quiz>? quizzes;

  factory AllQuizResponseModel.fromJson(Map<String, dynamic> json) {
    return AllQuizResponseModel(
      code: json["code"],
      status: json["status"],
      count: json["count"],
      quizzes: json["quizzes"] == null
          ? []
          : List<Quiz>.from(json["quizzes"]!.map((x) => Quiz.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "count": count,
        "quizzes": quizzes?.map((x) => x.toJson()).toList(),
      };
}

class Quiz {
  Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? title;
  final String? description;
  final Category? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "category": category?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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
