class ConnectionUpdateModel {
  ConnectionUpdateModel({
    this.reqFrom,
    this.response,
    this.type,
    this.message,
  });

  final String? reqFrom;
  final bool? response;
  final String? type;
  final String? message;

  factory ConnectionUpdateModel.fromJson(Map<String, dynamic> json) =>
      ConnectionUpdateModel(
        reqFrom: json["reqFrom"],
        response: json["response"],
        type: json["type"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "reqFrom": reqFrom,
        "response": response,
        "type": type,
        "message": message,
      };
}
