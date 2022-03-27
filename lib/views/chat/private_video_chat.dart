// ignore_for_file: library_prefixes, must_be_immutable, use_rethrow_when_possible, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
// import 'dart:collection';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wakelock/wakelock.dart';
import '../../constants.dart';
import '../../utils/constants.dart';

class AgoraCallPage extends StatefulWidget {
  String channelName;
  String token;
  AgoraCallPage({
    required this.channelName,
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<AgoraCallPage> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  late RtcEngineEventHandler rtcEngineEventHandler;
  bool isVideoDisable = false;
  bool isAudioDisable = false;
  bool isSecondCameraAvailable = false;
  String? duration;
  late double width;
  late double oldWidth;
  late double oldHeight;
  late double height;

  @override
  void initState() {
    super.initState();
    initAgora();
    Wakelock.enable();
  }

  @override
  void dispose() {
    super.dispose();
    _engine.leaveChannel();
    _engine.destroy();
    Wakelock.disable();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //Create the Engine
    _engine = await RtcEngine.create(appID);
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          // print("local user $uid joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        // rtcStats: (RtcStats rtcStats) {
        //   setState(() {
        //     duration = formatTime(rtcStats.duration * 1000);
        //   });
        // },
        userJoined: (int uid, int elapsed) {
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    try {
      await _engine.joinChannel(widget.token, widget.channelName, null, 0);
    } catch (e) {
      throw e;
    }
  }

  checkingForSecondCamera() async {
    final cameras = await availableCameras();
    // cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
    if (cameras.length == 1) {
      isSecondCameraAvailable = false;
    } else {
      isSecondCameraAvailable = true;
    }
  }

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    print(
        "-----------------------------------Hello----------------------------");
    return Container(
      decoration: BoxDecoration(color: mainColorNew),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          body: Container(
            color: Colors.black,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(alignment: Alignment.center, child: _remoteVideo()),

                isSecondCameraAvailable == true
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () async {
                            await _engine.switchCamera();
                          },
                          icon: const Icon(
                            Icons.flip_camera_android_rounded,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const SizedBox(),

                //timer
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.only(right: 16, top: 16),
                    child: Text(
                      duration ?? "00:00:00",
                      // formatTime(_stopwatch.elapsedMilliseconds),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                // localvideo + callend button + mute audio + disable video
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        //local video
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          width: 90,
                          height: 90,
                          child: _localUserJoined
                              ? CircleAvatar(
                                  radius: 50,
                                  child: RtcLocalView.SurfaceView(
                                    mirrorMode: VideoMirrorMode.Disabled,
                                    zOrderMediaOverlay: true,
                                    zOrderOnTop: true,
                                  ),
                                )
                              : const Center(
                                  child: SizedBox(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white12),
                                    ),
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        //call end
                        IconButton(
                          splashColor: Colors.black12,
                          onPressed: () async {
                            // await _engine.leaveChannel();
                            // await _engine.destroy();
                            // Wakelock.disable();
                            // Get.back();
                            // endSessionDilogBox(context);
                          },
                          icon: Icon(
                            Icons.call_end,
                            color: Colors.deepOrange.shade700,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   width: double.infinity,
                //   padding: const EdgeInsets.all(12),
                //   decoration: BoxDecoration(color: mainColorNew),
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: deviceHeight * 0.11994002998,
                //       ),

                //       SizedBox(
                //         height: deviceHeight * 0.029,
                //       ),

                //       //Local Video

                //       Row(
                //         children: [
                //           SizedBox(
                //             width: deviceWidth - 124,
                //             // decoration: BoxDecoration(
                //             //     border: Border.all(color: Colors.red)),
                //             child: Row(
                //               children: [
                //                 Column(
                //                   children: [
                //                     SizedBox(
                //                       // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                //                       width: deviceWidth - 124,
                //                       child: Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceEvenly,
                //                         children: [
                //                           // const SizedBox(
                //                           //   width: 4,
                //                           // ),
                //                           IconButton(
                //                             splashColor: Colors.black12,
                //                             onPressed: () {
                //                               // showModal(context, chatController);
                //                             },
                //                             // ignore: prefer_const_constructors
                //                             icon: Icon(
                //                               Icons.message_outlined,
                //                               size: 24,
                //                               color: Colors.white,
                //                             ),
                //                           ),
                //                           IconButton(
                //                             splashColor: Colors.black12,
                //                             onPressed: () async {
                //                               isVideoDisable == false
                //                                   ? await _engine
                //                                       .muteLocalVideoStream(
                //                                           true)
                //                                   : await _engine
                //                                       .muteLocalVideoStream(
                //                                           false);
                //                               setState(() {
                //                                 isVideoDisable == true
                //                                     ? isVideoDisable = false
                //                                     : isVideoDisable = true;
                //                                 print(
                //                                     "isVideoOff $isVideoDisable");
                //                               });
                //                             },
                //                             icon: Icon(
                //                               isVideoDisable == true
                //                                   ? Icons.videocam_off
                //                                   : Icons.videocam,
                //                               size: 24,
                //                               color: Colors.white,
                //                             ),
                //                           ),

                //                           IconButton(
                //                             splashColor: Colors.black38,
                //                             onPressed: () async {
                //                               isAudioDisable == false
                //                                   ? await _engine.disableAudio()
                //                                   : await _engine.enableAudio();
                //                               setState(() {
                //                                 isAudioDisable == true
                //                                     ? isAudioDisable = false
                //                                     : isAudioDisable = true;
                //                                 print(
                //                                     "isAudioOff $isAudioDisable");
                //                               });
                //                             },
                //                             icon: Icon(
                //                               isAudioDisable == true
                //                                   ? Icons.mic_off_rounded
                //                                   : Icons.mic_rounded,
                //                               size: 24,
                //                               color: Colors.white,
                //                             ),
                //                           ),
                //                           IconButton(
                //                             splashColor: Colors.black12,
                //                             onPressed: () async {
                //                               // await _engine.leaveChannel();
                //                               // await _engine.destroy();
                //                               // Wakelock.disable();
                //                               // Get.back();
                //                               // endSessionDilogBox(context);
                //                             },
                //                             icon: Icon(
                //                               Icons.call_end,
                //                               color: Colors.deepOrange.shade700,
                //                               size: 24,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 )
                //               ],
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//   // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(
        uid: _remoteUid!,
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white12),
            ),
            SizedBox(height: 10),
            const Text(
              'Please wait for other user to join...',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      );
    }
  }
}
