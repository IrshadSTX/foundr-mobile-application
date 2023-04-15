// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foundr_project/core/api/api_config.dart';

import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/model/api/message/get_message_model.dart';
import 'package:foundr_project/model/api/message/send_message_model.dart';
import 'package:foundr_project/services/messaging/messaging_services.dart';
import 'package:foundr_project/views/main_screens/message_screen/widgets/replay_card_widget.dart';
import 'package:foundr_project/views/main_screens/message_screen/widgets/send_card_widget.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessagingUser extends StatefulWidget {
  MessagingUser({super.key, this.selectedId, this.userId});

  String? selectedId;
  String? userId;
  List<GetMessageModel>? msgs = [];
  @override
  State<MessagingUser> createState() => _MessagingUserState();
}

class _MessagingUserState extends State<MessagingUser> {
  TextEditingController msgController = TextEditingController();
  late IO.Socket socket;

  @override
  void dispose() {
    super.dispose();
    socket.disconnect();
    socket.emit('disconnect', widget.userId);
  }

  @override
  void initState() {
    super.initState();
    log(widget.userId.toString(), name: 'kjjjjjjjjjjjj');
    log(widget.selectedId.toString(), name: 'llllll');
    connect();
    getMessage();
  }

  void connect() {
    socket = IO.io('http://$kBaseurl:8000', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    log("connected");
    socket.emit("addUser", widget.userId);
    socket.on("msg-receive", (data) {
      GetMessageModel model = GetMessageModel(
          myself: false, message: data, time: DateTime.now().toString());
      log("emmited");
      setState(() {
        widget.msgs!.add(model);
      });
      setState(() {});
    });
  }

  getMessage() async {
    await MessageService()
        .getMessageService(widget.selectedId!)
        .then((value) => {
              setState(() {
                widget.msgs = value;
              }),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      appBar: AppBar(
        backgroundColor: kGreen,
        title: const Text(
          "Messager Name",
          style: TextStyle(
            color: Color.fromARGB(255, 50, 103, 137),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: widget.msgs!.isEmpty
                  ? const Center(child: Text("No messages"))
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: widget.msgs!.length,
                        itemBuilder: (context, index) {
                          if (widget.msgs![index].myself == true) {
                            return sendCardWidget(
                                context, widget.msgs![index].message!);
                          } else {
                            return replayCardWidget(
                                context, widget.msgs![index].message!);
                          }
                        },
                      ),
                    ),
            ),
            TextField(
              controller: msgController,
              keyboardType: TextInputType.multiline,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(17),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'message',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 50, 103, 137),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 121, 161, 191),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {
                        sendMessage(msgController.text);
                        msgController.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                        size: 25,
                        color: Color.fromARGB(255, 6, 39, 66),
                      ),
                      splashColor: Colors.transparent,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage(String msg) async {
    GetMessageModel model = GetMessageModel(myself: true, message: msg);
    SendMessageModel sendModel =
        SendMessageModel(to: widget.selectedId, message: msg);
    setState(() {
      widget.msgs!.add(model);
    });
    socket.emit("send-msg", {"to": widget.selectedId, "message": msg});
    log("send messaged");

    await MessageService().sendMessageService(sendModel);
  }
}
