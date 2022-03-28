import 'dart:convert';

import 'package:agora_rtm/agora_rtm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:four_musti/constants.dart';
import 'package:four_musti/controller/auth.dart';
import 'package:four_musti/model/rtc_model.dart';
import 'package:four_musti/model/rtm_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/videocall.dart';
import '../utils/functions.dart';

class FetchAgoraData extends GetxController {
  Rx<RTCModel> rtcModel = RTCModel().obs;
  Rx<VideoCall> videoCallInfo = VideoCall().obs;
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  Rx<RTMModel> agoraRtmForUser = RTMModel().obs;
  RxBool isRTMFetched = false.obs;

  AuthController ac = Get.find<AuthController>();

  //fetch channel name and token from agora server
  Future fetchRTCInfo() async {
    try {
      final response = await http.get(Uri.parse(urlAgoraRTC));
      rtcModel.value = RTCModel.fromJson(jsonDecode(response.body));
      print(
          "ChannelName ${rtcModel.value.channelName} token ${rtcModel.value.agoraToken}");
    } catch (e) {
      throw e;
    }
  }

  //upload call Info to firebase doc
  callInfoToDoc() async {
    String uid = ac.userModel.value!.fbId ?? "";
    String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    String input = uid + timeStamp;
    String docID = Functions.hashing(input);
    videoCallInfo.update((val) {
      val!.docID = docID;
      val.callerID = uid;
      val.callerName = ac.userModel.value!.username;
      val.callerProfilePhoto = ac.userModel.value!.profilePic;
      val.receiverID = 'acer';
      val.receiverName = 'kylie Jenner';
      val.receiverProfilePhoto =
          "https://cdn.shopify.com/s/files/1/0067/4555/5015/files/Kylie-intro.jpg?1024";
      val.channelName = rtcModel.value.channelName;
      val.channelToken = rtcModel.value.agoraToken;
      val.callAttemptAt = Timestamp.now();
    });

    await firebase
        .collection('videoCallInfo')
        .doc(docID)
        .set(videoCallInfo.toJson(), SetOptions(merge: true));
  }

  fetchRTM() async {
    try {
      //For 1st User
      final _agoraRtmForUser = await http.post(
        Uri.parse(urlAgoraRTM),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: {
          'userID': ac.userModel.value!.fbId,
        },
      );
      agoraRtmForUser.value =
          RTMModel.fromJson(jsonDecode(_agoraRtmForUser.body));
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to load data");
      throw e;
    }
  }
}
