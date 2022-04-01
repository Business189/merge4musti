import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:four_musti/controller/auth.dart';
import 'package:four_musti/model/user_model.dart';
import 'package:four_musti/utils/temp_data.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AuthController ac = Get.find<AuthController>();
  late TabController tabController;
  RxInt index = 0.obs;
  RxBool isVisible = false.obs;
  RxList<bool> following = [false].obs;
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  RxList rejectedUsers = [].obs;
  late Stream<QuerySnapshot> stream;
  UserModel otherUser = UserModel();
  // ProfileController() {
  //   following.value = List.generate(suggestedList.length, (index) => false);
  // }
  @override
  void onInit() {
    stream = streamFx();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(chageTabIconColor);
    super.onInit();
  }

  chageTabIconColor() {
    index.value = tabController.index;
  }

  checkFollowing(int index) {
    following[index] = !following[index];
  }

  streamFx() {
    return firebase
        .collection('users')
        .where('fbID', isNotEqualTo: ac.userModel.value!.fbId)
        .where('uniqueID', whereNotIn: rejectedUsers)
        .where('block', isEqualTo: 0)
        .limit(5)
        .snapshots();
  }
}
