import 'package:four_musti/utils/temp_data.dart';
import 'package:get/get.dart';

class FollowController extends GetxController {
  RxList<bool> following = [false].obs;

  FollowController() {
    following.value = List.generate(topFollowingList.length, (index) => false);
  }

  checkFollowing(int index) {
    following[index] = !following[index];
  }
}
