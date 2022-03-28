// ignore_for_file: use_rethrow_when_possible

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:four_musti/model/user_model.dart';
import 'package:four_musti/utils/constants.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  Rx<UserModel?> userModel = UserModel().obs;
  final firebase = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var _authResult;

  RxString? profilePic = ''.obs;
  String? displayName;
  String? email;

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
        print("DisplayName>>>> $displayName");
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
  Future<void> createUser(String fullName, userName) async {
    await EasyLoading.show(status: 'loading...');

    try {
      if (await createorUpdateUser(_authResult, fullName, userName)) {
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
          // name: _auth.currentUser!.displayName ?? fullName,
          mobileNo: "",
          gender: "male",
          profilePic: _auth.currentUser!.photoURL,
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
    print("USERS ===> $data");
    if (data.exists) {
      userModel.value = UserModel.fromJson(data.data()!);
      return userModel.value;
    } else {
      return null;
    }
  }

  Future<void> storeInSharedPreference() async {
    await box.write('uid', userModel.value!.fbId);
  }

  void signOut() async {
    await _auth.signOut();
  }
}
