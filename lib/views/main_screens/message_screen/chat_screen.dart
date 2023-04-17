import 'package:flutter/material.dart';
import 'package:foundr_project/controllers/provider/chat/messaging_provider.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/constants.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';
import 'package:foundr_project/views/main_screens/message_screen/widgets/replay_card_widget.dart';
import 'package:foundr_project/views/main_screens/message_screen/widgets/send_card_widget.dart';
import 'package:provider/provider.dart';

class MessagingUser extends StatelessWidget {
  const MessagingUser({
    super.key,
    this.userName,
    this.selectedId,
    this.profilePhoto,
    this.userId,
  });
  final String? userName;
  final String? selectedId;
  final String? profilePhoto;
  final String? userId;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<MessagingUserProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: kCream,
      body: SizedBox(
        child: Consumer<MessagingUserProvider>(builder: (context, data, child) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
                width: double.infinity,
                height: size.height * .175,
                color: kYellow,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    kWidth10,
                    CircleAvatar(
                      radius: 25,
                      child: profilePhoto != 'null'
                          ? CircleAvatar(
                              radius: 25,
                              backgroundImage: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/user.png',
                                image: profilePhoto!,
                                fit: BoxFit.fill,
                                fadeInDuration:
                                    const Duration(milliseconds: 500),
                              ).image)
                          : const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/images/user.png"),
                            ),
                    ),
                    kWidth20,
                    TextStyleWidget(
                      fontsize: 22,
                      textcolor: Colors.white,
                      thick: FontWeight.bold,
                      title: userName!,
                    )
                  ],
                ),
              ),
              Expanded(
                child: data.msgs!.isEmpty
                    ? const Center(child: Text("No messages"))
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: data.msgs!.length,
                          itemBuilder: (context, index) {
                            if (data.msgs![index].myself == true) {
                              return sendCardWidget(
                                  context, data.msgs![index].message!);
                            } else {
                              return replayCardWidget(
                                  context, data.msgs![index].message!);
                            }
                          },
                        ),
                      ),
              ),
              TextField(
                controller: data.msgController,
                keyboardType: TextInputType.multiline,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(17),
                    border: OutlineInputBorder(
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
                          data.sendMessage(data.msgController.text);
                          data.msgController.clear();
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
          );
        }),
      ),
    );
  }
}
