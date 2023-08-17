class QuizResultPostBodyModel {
  QuizResultPostBodyModel({
    required this.points,
  });

  final int? points;

  factory QuizResultPostBodyModel.fromJson(Map<String, dynamic> json) {
    return QuizResultPostBodyModel(
      points: json["points"],
    );
  }

  Map<String, dynamic> toJson() => {
        "points": points,
      };
}
