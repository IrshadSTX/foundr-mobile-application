class SendMessageModel {
  SendMessageModel({
    this.to,
    this.message,
  });

  final String? to;
  final String? message;

  factory SendMessageModel.fromJson(Map<String, dynamic> json) =>
      SendMessageModel(
        to: json["to"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "to": to,
        "message": message,
      };
}
