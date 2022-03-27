// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:camera/camera.dart';
import 'package:four_musti/controller/fetch_agora_data.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants.dart';
import '../utils/functions.dart';

class PrivateVideoChatController extends GetxController {
  FetchAgoraData fad = Get.find<FetchAgoraData>();
  RxInt? remoteUid;
  RxInt? localUserUid;
  RxBool localUserJoined = false.obs;
  late RtcEngine engine;
  late RtcEngineEventHandler rtcEngineEventHandler;
  bool isVideoDisable = false;
  bool isAudioDisable = false;
  RxBool isSecondCameraAvailable = false.obs;
  String networkQuality = "";
  bool isChatVisible = false;
  RxString? duration;
  late double width;
  late double oldWidth;
  late double oldHeight;
  late double height;

  String? agoraToken;
  String? channelName;

  @override
  onInit() {
    initAgora();
    checkingForSecondCamera();
    super.onInit();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //Create the Engine
    engine = await RtcEngine.create(appID);
    await engine.enableVideo();
    engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          localUserJoined.value = true;
          localUserUid?.value = uid;
          print("LOCALLLLLUID ${localUserUid?.value}");
        },
        // rtcStats: (RtcStats rtcStats) {
        //   duration!.value = Functions.formatTime(rtcStats.duration * 1000);
        // },
        userJoined: (int uid, int elapsed) {
          remoteUid?.value = uid;
          print("REMOTEEEEEEUID ${remoteUid?.value}");
        },
        userOffline: (int uid, UserOfflineReason reason) {
          remoteUid = null;
        },
      ),
    );

    //agoraInformation
    agoraToken = fad.rtcModel.value.agoraToken;
    channelName = fad.rtcModel.value.channelName;

    try {
      await engine.joinChannel(agoraToken!, channelName!, null, 0);
    } catch (e) {}
  }

  callDisconnect() {
    engine.leaveChannel();
    engine.destroy();
  }

  checkingForSecondCamera() async {
    final cameras = await availableCameras();
    if (cameras.length == 1) {
      isSecondCameraAvailable.value = false;
    } else {
      isSecondCameraAvailable.value = true;
    }
  }
}
