// ignore_for_file: use_rethrow_when_possible

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:four_musti/model/user_model.dart';
import 'package:four_musti/utils/constants.dart';
import 'package:four_musti/utils/functions.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  Rx<UserModel?> userModel = UserModel().obs;

  //firebase variables
  final firebase = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instanceFor(
          bucket: 'masti-edeb9.appspot.com');
  var _authResult;

  //controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  //create user related variables
  RxString? profilePic = ''.obs;
  String? displayName;
  String? email;

  //profile picture related variables
  var croppedImage;
  XFile? pickedFile;
  File? pickedImage;
  Rx<String> imageFile = "".obs;
  final imagePicker = ImagePicker();
  RxString downloadUrlAuth = "".obs;
  Rx<bool> isSelect = false.obs;

  //video hashtag related variables
  RxList hashTagsList = [].obs;
  TextEditingController hashtag = TextEditingController();

//Sign In with gmail
  Future signInwithGoogle() async {
    await EasyLoading.show(status: "Loading...");
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      _authResult = await _auth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo!.isNewUser) {
        EasyLoading.dismiss();
        displayName = _auth.currentUser!.displayName;
        // print("DisplayName>>>> $displayName");
        email = _auth.currentUser!.email;
        nameController = TextEditingController(text: displayName ?? "");
        userNameController = TextEditingController();
        emailController = TextEditingController(text: email ?? "");
        profilePic!.value = _auth.currentUser!.photoURL!;

        Get.offNamed("ACCOUNT_DETAILS");
      } else {
        EasyLoading.dismiss();
        await storeInSharedPreference();
        Get.offNamed("ROOT");
      }
    } on FirebaseAuthException catch (e) {
      // print(e.message);
      throw e;
    }
  }

  //create user
  Future<void> createUser(
      String fullName, String userName, String mobileNo) async {
    await EasyLoading.show(status: 'loading...');

    try {
      if (await createorUpdateUser(_authResult, fullName, userName, mobileNo)) {
        Get.offNamed('ROOT');
      }
    } catch (e) {
      // showSnackBar(type: ERROR, message: e.toString());
    } finally {
      await EasyLoading.dismiss();
    }
  }

  Future<bool> createorUpdateUser(
    UserCredential userCredential,
    String? fullName,
    String? userName,
    String? mobileNo,
  ) async {
    Timestamp _currentTimeStamp = Timestamp.now();
    User fireBaseUser = userCredential.user!;
    // String? _token = await _fcm.getToken();

    if (userCredential.additionalUserInfo!.isNewUser) {
      try {
        // userData.value = null;
        userModel.value = UserModel(
          id: _auth.currentUser!.uid,

          fbId: _auth.currentUser!.uid,
          email: _auth.currentUser!.email,
          country: "India",
          username: userName ?? "Unknown",
          displayName: fullName ?? "Unknown",
          profilePic: downloadUrlAuth.value,
          // name: _auth.currentUser!.displayName ?? fullName,
          mobileNo: mobileNo ?? "",
          gender: "male",
          created: _currentTimeStamp,
          lastActive: _currentTimeStamp,
          bio: "",
          device:
              '${Platform.operatingSystem} - ${Platform.operatingSystemVersion}',
          totalFollowers: 0,
          totalVideos: 0,
          amountInWallet: 0,
          totalFlames: 0,
          totalDiamonds: 0,
          level: 0,
        );

        await firebase
            .collection(USERS)
            .doc(_auth.currentUser!.uid)
            .set(userModel.toJson(), SetOptions(merge: true));

        return true;
      } catch (e) {
        debugPrint('Error: ${e.toString()}');
        return false;
      }
    } else {
      try {
        userModel.value = await fetchUserData();
        // if (userData.value?.uid == null) await fetchUserData();

        userModel.update((value) {
          value!.lastActive = _currentTimeStamp;
          value.device =
              '${Platform.operatingSystem} - ${Platform.operatingSystemVersion}';
        });

        await firebase
            .collection(USERS)
            .doc(fireBaseUser.uid)
            .set(userModel.toJson(), SetOptions(merge: true));
        return true;
      } catch (e) {
        debugPrint('Error: ${e.toString()}');
        return false;
      }
    }
  }

  //fetch user data
  Future<UserModel?> fetchUserData() async {
    // String uid = _auth.currentUser!.uid;
    DocumentSnapshot<Map<String, dynamic>> data =
        await firebase.collection(USERS).doc(_auth.currentUser!.uid).get();
    // print("USERS ===> $data");
    if (data.exists) {
      userModel.value = UserModel.fromJson(data.data()!);
      return userModel.value;
    } else {
      return null;
    }
  }

  //image picker
  Future loadPicker(ImageSource source) async {
    await EasyLoading.show(status: 'Uploading...');
    try {
      pickedFile = await imagePicker.pickImage(
        source: source,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        await _cropImage(pickedFile!.path);
        imageFile.value = croppedImage.path;
        String fileExtension = pickedFile!.path.split('.').last;
        // print(imageFile);
        // print(_auth.currentUser!.uid);
        isSelect.value = true;
        String? hashing = Functions.hashing(_auth.currentUser!.uid +
            DateTime.now().microsecondsSinceEpoch.toString());
        await uploadImageFirebase(
            File(imageFile.value), hashing, fileExtension);
      } else {
        // SvgPicture.asset("assets/signOut.svg");
        // print('No image selected.');
        Fluttertoast.showToast(msg: 'No image selected.');
      }
    } catch (e) {
      // print(e.toString());
      throw e;
    }
    EasyLoading.dismiss();
  }

  //crop image -- Helper function
  Future<void> _cropImage(filePath) async {
    croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
  }

  //upload image to firebase
  Future uploadImageFirebase(image, path, extension) async {
    try {
      var snapshot = await _storage
          .ref('profile_pic/')
          .child(_auth.currentUser!.uid)
          .child('$path.$extension')
          .putFile(image);
      profilePic!.value = await snapshot.ref.getDownloadURL();
      downloadUrlAuth.value = profilePic!.value;
    } catch (e) {
      print("Unavailable");
    }
  }

  //video hashtags
  addHashTags() {
    if (hashtag.text.isNotEmpty) {
      hashTagsList.add(hashtag.text);
      hashtag.clear();
    }
    print(hashTagsList);
  }

  Future<void> storeInSharedPreference() async {
    await box.write('uid', userModel.value!.fbId);
  }

  void signOut() async {
    await _auth.signOut();
  }
}
