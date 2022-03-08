import 'package:flutter/material.dart';
import 'package:four_musti/controller/auth.dart';
import 'package:four_musti/utils/temp_data.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AuthController ac = Get.find<AuthController>();
  late TabController tabController;
  RxInt index = 0.obs;
  RxBool isVisible = true.obs;
  RxList<bool> following = [false].obs;

  ProfileController() {
    following.value = List.generate(suggestedList.length, (index) => false);
  }
  @override
  void onInit() {
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
}
