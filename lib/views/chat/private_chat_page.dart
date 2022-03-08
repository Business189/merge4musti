// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import '../../controller/private_chat_controller.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  PrivateChatController pcc = Get.put(PrivateChatController());
  @override
  Widget build(BuildContext context) {
    _showGiftsList() {}
    void _handleAtachmentPressed() {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SizedBox(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Get.back();
                      pcc.handleImageSelection();
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Photo'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                      pcc.handleFileSelection();
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('File'),
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () {
                  //     Get.back();
                  //     _showGiftsList();
                  //   },
                  //   child: const Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text('Gifts'),
                  //   ),
                  // ),
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Cancel'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
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
            );
          },
        ),
      ),
    );
  }
}
