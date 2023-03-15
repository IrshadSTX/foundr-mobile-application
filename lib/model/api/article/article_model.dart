class Article {
  Article({
    this.id,
    this.title,
    this.content,
    this.coverImage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
  final String? id;
  final String? title;
  final String? content;
  final String? coverImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json["_id"],
      title: json["title"],
      content: json["content"],
      coverImage: json["coverImage"],
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      updatedAt:
          json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      v: json["__v"],
    );
  }
  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "content": content,
        "coverImage": coverImage,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
