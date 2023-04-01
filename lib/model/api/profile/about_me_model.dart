class AboutMeModel {
  AboutMeModel({
    this.isTechnical,
    this.haveIdea,
    this.accomplishments,
    this.education,
    this.employment,
    this.responsibilities,
    this.interests,
  });

  int? isTechnical;
  String? haveIdea;
  String? accomplishments;
  String? education;
  String? employment;
  List<dynamic>? responsibilities;
  List<dynamic>? interests;

  factory AboutMeModel.fromJson(Map<String, dynamic> json) => AboutMeModel(
        isTechnical: json["isTechnical"],
        haveIdea: json["haveIdea"],
        accomplishments: json["accomplishments"],
        education: json["education"],
        employment: json["employment"],
        responsibilities:
            List<dynamic>.from(json["responsibilities"].map((x) => x)),
        interests: List<dynamic>.from(json["interests"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "isTechnical": isTechnical,
        "haveIdea": haveIdea,
        "accomplishments": accomplishments,
        "education": education,
        "employment": employment,
        "responsibilities": responsibilities == null
            ? []
            : List<dynamic>.from(responsibilities!.map((x) => x)),
        "interests": interests == null
            ? []
            : List<dynamic>.from(interests!.map((x) => x)),
      };
}
