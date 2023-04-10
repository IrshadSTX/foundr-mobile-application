class ConnectionReqModel {
  ConnectionReqModel({
    this.receiver,
  });

  final String? receiver;

  factory ConnectionReqModel.fromJson(Map<String, dynamic> json) =>
      ConnectionReqModel(
        receiver: json["receiver"],
      );

  Map<String, dynamic> toJson() => {
        "receiver": receiver,
        "type": "request",
        "message": "sent you a connection request"
      };
}
