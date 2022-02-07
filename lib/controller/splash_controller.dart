import 'package:get/get.dart';

class SplashController extends GetxController {
  RxDouble opacity = 0.0.obs;

  fadeIn() {
    Future.delayed(Duration(milliseconds: 50), () {
      opacity.value = 1.0;
    });
  }
}
