// ignore_for_file: file_names
// To parse this JSON data, do
//
//     final connectionResModel = connectionResModelFromJson(jsonString);

// import 'dart:convert';

// ConnectionResModel connectionResModelFromJson(String str) => ConnectionResModel.fromJson(json.decode(str));

// String connectionResModelToJson(ConnectionResModel data) => json.encode(data.toJson());

class ConnectionResModel {
  ConnectionResModel({
    this.connections,
  });

  final List<Connection>? connections;

  factory ConnectionResModel.fromJson(Map<String, dynamic> json) =>
      ConnectionResModel(
        connections: json["connections"] == null
            ? []
            : List<Connection>.from(
                json["connections"]!.map((x) => Connection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "connections": connections == null
            ? []
            : List<dynamic>.from(connections!.map((x) => x.toJson())),
      };
}

class Connection {
  Connection({
    this.location,
    this.id,
    this.userName,
    this.email,
    this.password,
    this.status,
    this.responsibilities,
    this.interests,
    this.cofounderResponsibilities,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.profilePhoto,
    this.connections,
    this.age,
    this.gender,
    this.intro,
    this.activelySeeking,
    this.cofounderHasIdea,
    this.cofounderTechnical,
    this.locationPreference,
    this.accomplishments,
    this.education,
    this.employment,
    this.haveIdea,
    this.isTechnical,
  });

  final Location? location;
  final String? id;
  final String? userName;
  final String? email;
  final String? password;
  final String? status;
  final List<String>? responsibilities;
  final List<String>? interests;
  final List<String>? cofounderResponsibilities;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? profilePhoto;
  final List<String>? connections;
  final int? age;
  final String? gender;
  final String? intro;
  final int? activelySeeking;
  final int? cofounderHasIdea;
  final int? cofounderTechnical;
  final int? locationPreference;
  final String? accomplishments;
  final String? education;
  final String? employment;
  final String? haveIdea;
  final int? isTechnical;

  factory Connection.fromJson(Map<String, dynamic> json) => Connection(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        id: json["_id"],
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
        status: json["status"],
        responsibilities: json["responsibilities"] == null
            ? []
            : List<String>.from(json["responsibilities"]!.map((x) => x)),
        interests: json["interests"] == null
            ? []
            : List<String>.from(json["interests"]!.map((x) => x)),
        cofounderResponsibilities: json["cofounderResponsibilities"] == null
            ? []
            : List<String>.from(
                json["cofounderResponsibilities"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        profilePhoto: json["profilePhoto"],
        connections: json["connections"] == null
            ? []
            : List<String>.from(json["connections"]!.map((x) => x)),
        age: json["age"],
        gender: json["gender"],
        intro: json["intro"],
        activelySeeking: json["activelySeeking"],
        cofounderHasIdea: json["cofounderHasIdea"],
        cofounderTechnical: json["cofounderTechnical"],
        locationPreference: json["locationPreference"],
        accomplishments: json["accomplishments"],
        education: json["education"],
        employment: json["employment"],
        haveIdea: json["haveIdea"],
        isTechnical: json["isTechnical"],
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "_id": id,
        "userName": userName,
        "email": email,
        "password": password,
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
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "profilePhoto": profilePhoto,
        "connections": connections == null
            ? []
            : List<dynamic>.from(connections!.map((x) => x)),
        "age": age,
        "gender": gender,
        "intro": intro,
        "activelySeeking": activelySeeking,
        "cofounderHasIdea": cofounderHasIdea,
        "cofounderTechnical": cofounderTechnical,
        "locationPreference": locationPreference,
        "accomplishments": accomplishments,
        "education": education,
        "employment": employment,
        "haveIdea": haveIdea,
        "isTechnical": isTechnical,
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
