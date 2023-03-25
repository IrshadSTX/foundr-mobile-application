class UserProfileModel {
  UserProfileModel({
    this.userDetails,
  });

  final UserDetails? userDetails;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        userDetails: json["userDetails"] == null
            ? null
            : UserDetails.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "userDetails": userDetails?.toJson(),
      };
}

class UserDetails {
  UserDetails({
    this.location,
    this.id,
    this.userName,
    this.email,
    this.status,
    this.responsibilities,
    this.interests,
    this.cofounderResponsibilities,
    this.connections,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.profilePhoto,
    this.age,
    this.gender,
    this.intro,
  });

  final Location? location;
  final String? id;
  final String? userName;
  final String? email;
  final String? status;
  final List<dynamic>? responsibilities;
  final List<dynamic>? interests;
  final List<dynamic>? cofounderResponsibilities;
  final List<dynamic>? connections;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? profilePhoto;
  final int? age;
  final String? gender;
  final String? intro;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        id: json["_id"],
        userName: json["userName"],
        email: json["email"],
        status: json["status"],
        responsibilities: json["responsibilities"] == null
            ? []
            : List<dynamic>.from(json["responsibilities"]!.map((x) => x)),
        interests: json["interests"] == null
            ? []
            : List<dynamic>.from(json["interests"]!.map((x) => x)),
        cofounderResponsibilities: json["cofounderResponsibilities"] == null
            ? []
            : List<dynamic>.from(
                json["cofounderResponsibilities"]!.map((x) => x)),
        connections: json["connections"] == null
            ? []
            : List<dynamic>.from(json["connections"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        profilePhoto: json["profilePhoto"],
        age: json["age"],
        gender: json["gender"],
        intro: json["intro"],
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "_id": id,
        "userName": userName,
        "email": email,
        "status": status,
        "responsibilities": responsibilities == null
            ? []
            : List<dynamic>.from(responsibilities!.map((x) => x)),
        "interests": interests == null
            ? []
            : List<dynamic>.from(interests!.map((x) => x)),
        "cofounderResponsibilities": cofounderResponsibilities == null
            ? []
            : List<dynamic>.from(cofounderResponsibilities!.map((x) => x)),
        "connections": connections == null
            ? []
            : List<dynamic>.from(connections!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "profilePhoto": profilePhoto,
        "age": age,
        "gender": gender,
        "intro": intro,
      };
}

class Location {
  Location({
    this.country,
    this.state,
    this.city,
  });

  final String? country;
  final String? state;
  final String? city;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        country: json["country"],
        state: json["state"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "state": state,
        "city": city,
      };
}
