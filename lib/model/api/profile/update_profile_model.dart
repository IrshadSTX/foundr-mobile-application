class UpdateUseraboutModel {
  UpdateUseraboutModel({
    this.intro,
    this.gender,
    this.age,
    this.nation,
    this.state,
    this.city,
  });

  final String? intro;
  final String? gender;
  final String? age;
  final String? nation;
  final String? state;
  final String? city;

  factory UpdateUseraboutModel.fromJson(Map<String, dynamic> json) =>
      UpdateUseraboutModel(
        intro: json["intro"],
        gender: json["gender"],
        age: json["age"],
        nation: json["country"],
        state: json["state"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "intro": intro,
        "gender": gender,
        "age": age,
        "country": nation,
        "state": state,
        "city": city,
      };
}
