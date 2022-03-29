// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:four_musti/controller/auth.dart';
import 'package:four_musti/model/video.dart';
import 'package:four_musti/views/widgets/CameraView.dart';
import 'package:imgly_sdk/imgly_sdk.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
// import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

// late List<CameraDescription> cameras;
List<CameraDescription> cameras = <CameraDescription>[];

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  Future<void>? cameraValue;
  bool isRecoring = false;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;

  Rx<String> imageFile = "".obs;
  RxString resourceDownloadUrl = "".obs;
  File? file;
  RxList videoUrls = [].obs;
  RxString videoId = "".obs;

  Rx<Video> videoModel = Video().obs;
  late XFile videopath;

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final AuthController ac = Get.put(AuthController());

  initializeCamera() async {
    //Get list of available cameras
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void initState() {
    initializeCamera();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  Configuration createConfiguration() {
    final flutterSticker = Sticker(
        "example_sticker_logos_flutter", "Flutter", "assets/Flutter-logo.png");
    final imglySticker = Sticker(
        "example_sticker_logos_imgly", "img.ly", "assets/IgorSticker.png");

    /// A completely custom category.
    final logos = StickerCategory(
        "example_sticker_category_logos", "Logos", "assets/Flutter-logo.png",
        items: [flutterSticker, imglySticker]);

    /// A predefined category.
    final emoticons =
        StickerCategory.existing("imgly_sticker_category_emoticons");

    /// A customized predefined category.
    final shapes =
        StickerCategory.existing("imgly_sticker_category_shapes", items: [
      Sticker.existing("imgly_sticker_shapes_badge_01"),
      Sticker.existing("imgly_sticker_shapes_arrow_02")
    ]);
    var categories = <StickerCategory>[logos, emoticons, shapes];
    final configuration = Configuration(
        sticker:
            StickerOptions(personalStickers: true, categories: categories));
    return configuration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue, //??null,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: CameraPreview(_cameraController));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          flash ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          //   setState(() {
                          //     flash = !flash;
                          //   });
                          //   flash
                          //       ? _cameraController.setFlashMode(FlashMode.torch)
                          //       : _cameraController.setFlashMode(FlashMode.off);
                        },
                      ),
                      InkWell(
                        onTap: () async {
                          if (isRecoring == false) {
                            EasyLoading.show(status: "Starting...");
                            await Future.delayed(Duration(seconds: 5));
                            try {
                              setState(() {
                                isRecoring = true;
                                // ac.buttonEnable.value = true;
                              });
                              // isRecoring = true;

                              await _cameraController.startVideoRecording();
                              // _cameraController.pauseVideoRecording();
                              print("Started");
                              EasyLoading.dismiss();
                            } catch (e) {
                              print(e);
                            }
                          } else {
                            setState(() {
                              // isRecoring = true;
                              isRecoring = false;
                            });
                            // await _cameraController.stopVideoRecording();
                            await _showDialogthree(context);
                            videopath =
                                await _cameraController.stopVideoRecording();

                            print("Stopped");
                          }
                        },
                        child: isRecoring == true
                            ? Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 70,
                              ),
                        // onLongPressUp: () async {

                        //   setState(() {
                        //     isRecoring = false;
                        //   }
                        //   );
                        // final result = await VESDK.openEditor(
                        //     Video(videopath.path), //'assets/Skater.mp4'
                        //     configuration: createConfiguration());
                        // print(
                        // '\x1B[33m IMG.LY VESDK ----: ${result!.toJson()} \x1B[0m');
                        // IMG.LY VESDK ----: {video: file:///data/user/0/com.ap.fourmusti/cache/imgly_5205380838323254423.mp4, hasChanges: true, serialization: null}
                        // final Map<String, dynamic> map =
                        //     result.toJson(); //json.decode(response);

                        // imageFile.value = map['video'];
                        // print("==================${imageFile.value}");

                        // );

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (builder) => VideoEditorComponent(path: 'assets/Skater.mp4',)));//VideoViewPage(path: videopath.path,)));
                        // },
                        // onTap: () {
                        //   if (!isRecoring) takePhoto(context);
                        // },
                      ),
                      IconButton(
                          icon: Transform.rotate(
                            angle: transform,
                            child: Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              iscamerafront = !iscamerafront;
                              transform = transform + pi;
                            });
                            int cameraPos = iscamerafront ? 0 : 1;
                            _cameraController = CameraController(
                                cameras[cameraPos], ResolutionPreset.high);
                            cameraValue = _cameraController.initialize();
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Hold for Video, tap for photo",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    XFile file = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraViewPage(
                  path: file.path,
                )));
  }

  // Future uploadFile(String filepath) async {
  //   // Future<UploadTask?> task;
  //   UploadTask? task;
  //   // if (filepath == null) return;
  //   File file = File(filepath);

  //   final fileName = basename(file.path);
  //   // final destination = 'videos/$fileName';

  //   task = await FirebaseUploader.uploadFile(fileName, file);
  //   setState(() {});

  //   if (task == null) return;

  //   final snapshot = await task.whenComplete(() {});
  //   final urlDownload = await snapshot.ref.getDownloadURL();

  //   print('\x1B[33m Download-Link: $urlDownload  \x1B[0m');
  // }

  Future uploadFilesFirebase(fileName) async {
    await EasyLoading.show(status: 'Uploading...');
    try {
      // Rx<String> img = "".obs;
      // final file = basename(fileName.path);
      // XFile file = XFile(fileName);
      // img.value = file.path;
      // print(file.runtimeType);
      videoId.value = DateTime.now().millisecondsSinceEpoch.toString();
      file = File(fileName.path);
      var snapshot = await _storage
          .ref("temp_video/")
          .child(ac.userModel.value!.fbId!)
          .child(videoId.value)
          .putFile(file!);
      resourceDownloadUrl.value = await snapshot.ref.getDownloadURL();
      // videoUrls.add(resourceDownloadUrl.value);
      await videoData();
      // print(resourceDownloadUrl);
      // resourceFileList.add(resourceDownloadUrl);
      // infoFileName.add(fileName);
    } catch (e) {
      print(e);
    }
    EasyLoading.dismiss();
  }

  Future<void> videoData() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    await ac.firebase.collection("tempVideoData").doc(videoId.value).set({
      "username": ac.userModel.value!.displayName,
      "uid": ac.userModel.value!.fbId,
      "id": videoId.value,
      "likes": [],
      "commentCount": 0,
      "shareCount": 0,
      "songName": "",
      "caption": "",
      "videoUrl": resourceDownloadUrl.value,
      "profilePhoto": ac.userModel.value!.profilePic,
      "thumbnail": "",

      "allow_comments": "",
      "allow_duet": "",
      "created": formattedDate,
      "description": "",
      "fb_id": "",
      "first_name": "",
      "last_name": "",
      "numberViews": "",
      "privacy_type": "",
      "sound_id": "",
      "verified": "",
      "video_id": "",
      "views": "",
      // "url": resourceDownloadUrl.value,
      // "url": resourceDownloadUrl.value,
      // "videoName": file!.path,
      // "videoId": videoId.value,
      // "uid": ac.user.uid,
      // "userName": ac.user.displayName,
    }, SetOptions(merge: true));
    print("Uploaded");
  }

  _showDialogthree(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.zero,
          content: Container(
            padding: EdgeInsets.only(left: 14, right: 14, top: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: const [
                  Colors.green,
                  Colors.yellow,
                ],
              ),
            ),
            height: 200,
            width: MediaQuery.of(context).size.width * 0.99,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Tags",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                // TextField with add button
                Container(
                  height: 50,
                  // color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.99,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: ac.hashtag,
                          decoration: InputDecoration(
                            hintText: "Add Tags",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          ac.addHashTags();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // elevated button with text
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.99,
                  child: ElevatedButton(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(5),
                    // ),
                    // color: Colors.white,
                    onPressed: () async {
                      // ac.addHashTags();
                      Get.back();
                      await uploadFilesFirebase(videopath);
                    },
                    child: Text(
                      "Upload Video",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // primaryOutlineButton(
                //   text1: "CANCEL",
                //   text2: "APPLY",
                //   onPressed1: () {
                //     Get.back();
                //   },
                //   onPressed2: () {
                //     Get.back();
                //   },
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
