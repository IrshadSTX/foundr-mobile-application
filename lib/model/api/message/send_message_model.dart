class MessageSendModel {
  MessageSendModel({
    required this.sender,
    required this.receiver,
    required this.message,
    required this.id,
  });

  String sender;
  String receiver;
  String message;
  String id;

  factory MessageSendModel.fromJson(Map<String, dynamic> json) =>
      MessageSendModel(
        sender: json["sender"],
        receiver: json["receiver"],
        message: json["message"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "sender": sender,
        "receiver": receiver,
        "message": message,
        "_id": id,
      };
}
