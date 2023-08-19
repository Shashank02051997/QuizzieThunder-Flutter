class AllAvatarResponseModel {
  AllAvatarResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.avatars,
  });

  final int? code;
  final bool? status;
  final String? message;
  final List<Avatar>? avatars;

  factory AllAvatarResponseModel.fromJson(Map<String, dynamic> json) {
    return AllAvatarResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      avatars: json["avatars"] == null
          ? []
          : List<Avatar>.from(json["avatars"]!.map((x) => Avatar.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "avatars": avatars?.map((x) => x.toJson()).toList(),
      };
}

class Avatar {
  Avatar({
    required this.id,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? url;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      id: json["_id"],
      url: json["url"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "url": url,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
