class DiscoverScreenResponseModel {
  DiscoverScreenResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.topPicQuiz,
    required this.quizCategories,
  });

  final int? code;
  final bool? status;
  final String? message;
  final TopPicQuiz? topPicQuiz;
  final List<Category>? quizCategories;

  factory DiscoverScreenResponseModel.fromJson(Map<String, dynamic> json) {
    return DiscoverScreenResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      topPicQuiz: json["top_pic_quiz"] == null
          ? null
          : TopPicQuiz.fromJson(json["top_pic_quiz"]),
      quizCategories: json["quiz_categories"] == null
          ? []
          : List<Category>.from(
              json["quiz_categories"]?.map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "top_pic_quiz": topPicQuiz?.toJson(),
        "quiz_categories": quizCategories?.map((x) => x.toJson()).toList(),
      };
}

class Category {
  Category({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.quizCount,
  });

  final String? id;
  final String? title;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? quizCount;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["_id"],
      title: json["title"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      quizCount: json["quizCount"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "quizCount": quizCount,
      };
}

class TopPicQuiz {
  TopPicQuiz({
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

  factory TopPicQuiz.fromJson(Map<String, dynamic> json) {
    return TopPicQuiz(
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
