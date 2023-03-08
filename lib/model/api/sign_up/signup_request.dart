class SignupReqModel {
  SignupReqModel({
    required this.userName,
    required this.email,
    required this.password,
  });
  String? userName;
  String? email;
  String? password;

  factory SignupReqModel.fromJson(Map<String, dynamic> json) => SignupReqModel(
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
      );
  Map<String, dynamic> toJson() => {
        "userName": userName,
        "email": email,
        "password": password,
      };
}
