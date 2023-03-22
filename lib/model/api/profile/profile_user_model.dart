class UserDetails {
  UserDetails({
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
  });

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

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["_id"],
        userName: json["userName"],
        email: json["email"],
        status: json["status"],
        responsibilities:
            List<dynamic>.from(json["responsibilities"].map((x) => x)),
        interests: List<dynamic>.from(json["interests"].map((x) => x)),
        cofounderResponsibilities:
            List<dynamic>.from(json["cofounderResponsibilities"].map((x) => x)),
        connections: List<dynamic>.from(json["connections"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        profilePhoto: json["profilePhoto"],
      );
  Map<String, dynamic> toJson() => {
        // "location": location?.toJson(),
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
        // "age": age,
        // "gender": gender,
        // "intro": intro,
      };
}
