class CoFounderModel {
  CoFounderModel({
    required this.activelySeeking,
    required this.cofounderTechnical,
    required this.cofounderHasIdea,
    required this.locationPreference,
    required this.cofounderResponsibilities,
  });

  String activelySeeking;
  String cofounderTechnical;
  String cofounderHasIdea;
  String locationPreference;
  List<dynamic> cofounderResponsibilities;

  factory CoFounderModel.fromJson(Map<String, dynamic> json) => CoFounderModel(
        activelySeeking: json["activelySeeking"],
        cofounderTechnical: json["cofounderTechnical"],
        cofounderHasIdea: json["cofounderHasIdea"],
        locationPreference: json["locationPreference"],
        cofounderResponsibilities:
            List<dynamic>.from(json["cofounderResponsibilities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "activelySeeking": activelySeeking,
        "cofounderTechnical": cofounderTechnical,
        "cofounderHasIdea": cofounderHasIdea,
        "locationPreference": locationPreference,
        "cofounderResponsibilities":
            List<dynamic>.from(cofounderResponsibilities.map((x) => x)),
      };
}
