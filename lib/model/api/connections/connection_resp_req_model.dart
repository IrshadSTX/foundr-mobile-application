class ConnectionResponseModel {
  ConnectionResponseModel({
    this.connectionRequests,
  });

  final List<ConnectionRequest>? connectionRequests;

  factory ConnectionResponseModel.fromJson(Map<String, dynamic> json) =>
      ConnectionResponseModel(
        connectionRequests: json["connectionRequests"] == null
            ? []
            : List<ConnectionRequest>.from(json["connectionRequests"]!
                .map((x) => ConnectionRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "connectionRequests": connectionRequests == null
            ? []
            : List<dynamic>.from(connectionRequests!.map((x) => x.toJson())),
      };
}

class ConnectionRequest {
  ConnectionRequest({
    this.id,
    this.sender,
    this.receiver,
    this.status,
  });

  final String? id;
  final String? sender;
  final String? receiver;
  final String? status;

  factory ConnectionRequest.fromJson(Map<String, dynamic> json) =>
      ConnectionRequest(
        id: json["_id"],
        sender: json["sender"],
        receiver: json["receiver"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sender": sender,
        "receiver": receiver,
        "status": status,
      };
}
