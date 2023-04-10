class ConnectionResModel {
  ConnectionResModel({
    this.reqFrom,
    this.response,
    this.type,
    this.message,
  });

  final String? reqFrom;
  final bool? response;
  final String? type;
  final String? message;

  factory ConnectionResModel.fromJson(Map<String, dynamic> json) =>
      ConnectionResModel(
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
