class GetMessageModel {
  GetMessageModel({
    this.myself,
    this.message,
    this.time,
  });

  bool? myself;
  String? message;
  String? time;

  factory GetMessageModel.fromJson(Map<String, dynamic> json) =>
      GetMessageModel(
        myself: json["myself"],
        message: json["message"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "myself": myself,
        "message": message,
        "time": time,
      };
}
