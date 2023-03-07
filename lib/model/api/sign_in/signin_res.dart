class SigninRespModel {
  SigninRespModel({this.message, this.token});
  final String? message;
  final String? token;

  factory SigninRespModel.fromJson(Map<String, dynamic> json) =>
      SigninRespModel(
        message: json["message"],
        token: json["token"],
      );
  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
      };
}
