class SignupResModel {
  SignupResModel({
    required this.message,
    required this.token,
  });
  String? message;
  String? token;

  factory SignupResModel.fromJson(Map<String, dynamic> json) => SignupResModel(
        message: json["message"],
        token: json["token"],
      );
  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
      };
}
