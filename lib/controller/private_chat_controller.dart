// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:agora_rtm/agora_rtm.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:four_musti/constants.dart';
import 'package:four_musti/controller/auth.dart';
import 'package:four_musti/controller/fetch_agora_data.dart';
// import 'package:four_musti/model/rtm_model.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:uuid/uuid.dart';
import 'package:objectbox/objectbox.dart';

class PrivateChatController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AuthController ac = Get.find<AuthController>();
  FetchAgoraData fad = Get.find<FetchAgoraData>();
  String othersUserUID = 'QBWYtiYszqdf2rOwCGuCOz6a4vt2';

  late final AnimationController controller;
  RxList<types.Message> messages = RxList<types.Message>();
  late types.User user;
  AgoraRtmClient? _client;
  // List log = [];
  // Rx<RTMModel> rtmModel = RTMModel().obs;

  //objectbox DB
  late Store store;

  // final box = store.box<Person>();

  @override
  void onInit() async {
    user = types.User(id: ac.userModel.value!.fbId!);
    // messages = [];
    await createClient();
    await login();
    // loadMessages();
    // controller = AnimationController(vsync: this);
    super.onInit();
  }

  types.TextMessage textMesssage(String message, String peerId) {
    types.User _user = types.User(id: peerId);
    types.TextMessage _textMessage = types.TextMessage(
      author: _user,
      text: message,
      id: peerId + DateTime.now().millisecond.toString(),
    );
    return _textMessage;
  }

  //Agora messaging
  Future login() async {
    try {
      await _client
          ?.login(fad.agoraRtmForUser.value.agoraToken,
              fad.agoraRtmForUser.value.userId!)
          .then((value) => print(
              "Success __userID:${fad.agoraRtmForUser.value.userId}  & __token: ${fad.agoraRtmForUser.value.agoraToken}"));
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future createClient() async {
    _client = await AgoraRtmClient.createInstance(appID);
    _client?.onMessageReceived = ((message, peerId) {
      // {"message": message, : peerId}
      print("MessagesRTY : ${message.text}");

      types.TextMessage _textMessage = textMesssage(message.text, peerId);
      addMessage(_textMessage);
    });

    _client?.onConnectionStateChanged = ((state, reason) {
      print(
          "__state:${StateNotation[state.toString()]} __reason: ${ReasonNotation[reason.toString()]}");
      if (state == 5) {
        _client?.logout();
      }
    });
  }

  // sendMessage() async {
  //   if (othersUserUID.isEmpty) {
  //     return;
  //   }
  //   if (msgController.text.isEmpty) {
  //     Fluttertoast.showToast(msg: "Enter msg");
  //     return;
  //   }
  // }

  void addMessage(types.Message message) {
    messages.insert(0, message);
    messages.refresh();
    update();
  }

  //files
  void handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      addMessage(message);
    }
    update();
  }

  void handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );
      addMessage(message);
    }
  }

  void handleMessageTap(BuildContext context, types.Message message) async {
    if (message is types.FileMessage) {
      await OpenFile.open(message.uri);
    }
  }

  void handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = messages[index].copyWith(previewData: previewData);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      messages[index] = updatedMessage;
    });
    update();
  }

  void handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: user,
      // createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    print("Users Message : ${message.text}");

    try {
      AgoraRtmMessage agoraMessage = AgoraRtmMessage.fromText(message.text);
      await _client?.sendMessageToPeer(othersUserUID, agoraMessage);
      // Fluttertoast.showToast(msg: "Send peer message success");

    } catch (e) {
      print("ERROR: ${e.toString()}");
      //
    } finally {
      addMessage(textMessage);
    }
    update();
  }

  void loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final _messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();
    messages.value = _messages;
    update();
  }
}
