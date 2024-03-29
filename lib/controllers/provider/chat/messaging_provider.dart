import 'package:flutter/material.dart';
import 'package:foundr_project/core/api/api_config.dart';
import 'package:foundr_project/model/api/message/get_message_model.dart';
import 'package:foundr_project/model/api/message/send_message_model.dart';
import 'package:foundr_project/services/messaging/messaging_services.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessagingUserProvider with ChangeNotifier {
  List<GetMessageModel>? msgs = [];
  String? profilePhoto;
  String? userName;
  String? selectedId;
  String? userId;
  TextEditingController msgController = TextEditingController();
  IO.Socket? socket;

  void clearDispose() {
    super.dispose();
    socket?.disconnect();
    socket?.emit('disconnect', userId);
  }

  void firstRunState({required String selectedId}) {
    this.selectedId = selectedId;
    connect();
    getMessage();
  }

  void connect() {
    socket = IO.io('http://$kBaseurl:8000', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket?.connect();
    socket?.emit('addUser', userId);
    socket?.on('msg-recieve', (data) {
      GetMessageModel model = GetMessageModel(
          myself: false, message: data, time: DateTime.now().toString());
      msgs!.add(model);
      notifyListeners();
    });
  }

  Future<void> getMessage() async {
    await MessageService().getMessageService(selectedId!).then((value) => {
          msgs = value,
          notifyListeners(),
        });
  }

  void sendMessage(String msg) async {
    DateTime now = DateTime.now();

    GetMessageModel model = GetMessageModel(
        myself: true, message: msg, time: now.toIso8601String());
    SendMessageModel sendModel = SendMessageModel(to: selectedId, message: msg);
    msgs!.add(model);
    notifyListeners();
    socket!.emit("send-msg",
        {"to": selectedId, "message": msg, "time": now.toIso8601String()});
    await MessageService().sendMessageService(sendModel);
    msgController.clear();
    notifyListeners();
  }

  dateChange(String date) {
    DateTime dateTime = DateTime.parse(date);
    String time = DateFormat('h:mm a').format(dateTime);
    return time;
  }
}
