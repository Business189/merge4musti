import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxInt index = 0.obs;
  RxBool isVisible = true.obs;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(chageTabIconColor);
    super.onInit();
  }

  chageTabIconColor() {
    index.value = tabController.index;
  }
}
