// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables
// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:four_musti/constants.dart';
import 'package:four_musti/controller/fetch_agora_data.dart';
import 'package:four_musti/views/chat/private_video_chat.dart';
// import 'package:four_musti/constants.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/private_chat_controller.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PrivateChatController pcc = Get.put(PrivateChatController());
    FetchAgoraData fad = Get.put(FetchAgoraData());
    _showGiftsList() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return GestureDetector(
            onTap: () {
              Get.back();
            },
            child: DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.2,
              maxChildSize: 0.75,
              builder: (_, controller) {
                return Container(
                  padding: EdgeInsets.only(
                    top: 15,
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF1F1F1F),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0),
                    ),
                  ),
                  child: GridView.builder(
                    controller: controller,
                    itemCount: giftList.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          print("InDEX $index");
                        },
                        child: Card(
                          color: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: textColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Lottie.network(giftList[index]['url']),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    }

    void _handleAtachmentPressed() {
      showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext co0xFF0444A5ntext) {
          return Container(
            decoration: BoxDecoration(
              color: Color(0xFF1F1F1F),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            // height: 150,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                    pcc.handleImageSelection();
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1).withOpacity(0.02),
                      border:
                          Border.all(color: Color(0xFFF1F1F1).withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Images',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                    pcc.handleFileSelection();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10, left: 10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1).withOpacity(0.02),
                      border:
                          Border.all(color: Color(0xFFF1F1F1).withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'File',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                    _showGiftsList();
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1).withOpacity(0.02),
                      border:
                          Border.all(color: Color(0xFFF1F1F1).withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Gifts',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: mainColorNew, actions: [
        IconButton(
            onPressed: () async {
              await fad.fetchRTCInfo();
              // await fad.callInfoToDoc();
              await Get.to(AgoraCallPage(
                  channelName: fad.rtcModel.value.channelName ?? "",
                  token: fad.rtcModel.value.agoraToken ?? ""));
            },
            icon: Icon(Icons.video_call, color: accentColor)),
      ]),
      body: SafeArea(
        bottom: false,
        child: GetBuilder<PrivateChatController>(
          init: PrivateChatController(),
          builder: (context) {
            return Chat(
              messages: pcc.messages,
              onAttachmentPressed: _handleAtachmentPressed,
              onMessageTap: pcc.handleMessageTap,
              onPreviewDataFetched: pcc.handlePreviewDataFetched,
              onSendPressed: pcc.handleSendPressed,
              user: pcc.user,
              theme: DefaultChatTheme(
                inputBackgroundColor: Color(0xFF1F1F1F),
                attachmentButtonIcon: Icon(
                  Icons.apps_sharp,
                  color: Colors.white,
                ),
                inputTextColor: Colors.white,
                inputBorderRadius: BorderRadius.circular(50),
                inputMargin: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                inputPadding: EdgeInsets.all(16),
                sendButtonIcon: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
