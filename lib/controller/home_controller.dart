import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:four_musti/utils/temp_data.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeController extends GetxController {
  // RxInt page = 0.obs;
  // GlobalKey _bottomNavigationKey = GlobalKey();
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  RxInt selectedPage = 0.obs;
  PageController videoPageController = PageController(
    viewportFraction: 1,
  );
  bool get isLastpage => selectedPage.value == tempUserVideoData.length - 1;
  RxBool isLiked = false.obs;

  RxDouble turns = 0.0.obs;

  void changeRotation() {
    Future.delayed(30.milliseconds, () {
      turns.value = 3.0;
    });
  }

  // late BetterPlayerDataSource betterPlayerDataSource;
  // late BetterPlayerController betterPlayerController;

  RxBool isPlaying = false.obs;
  RxBool isEnded = false.obs;

  RxDouble widgetOpacity = 0.0.obs;
  RxDouble controlOpacity = 1.0.obs;
  RxInt clicksScreenPivot = 1.obs;

  // @override
  // void onInit() {
  //   betterPlayerDataSource = BetterPlayerDataSource(
  //       BetterPlayerDataSourceType.network, tempUserVideoData[0].videoUrl!);
  //   betterPlayerController = BetterPlayerController(
  //     BetterPlayerConfiguration(
  //         autoPlay: true,
  //         controlsConfiguration: BetterPlayerControlsConfiguration(
  //             showControls: false,
  //             loadingWidget: Center(
  //               child: SpinKitThreeBounce(
  //                 size: 20,
  //                 itemBuilder: (BuildContext context, int index) {
  //                   return DecoratedBox(
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(50),
  //                       color: index.isEven
  //                           ? Colors.pink.shade200
  //                           : Colors.grey.shade200,
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ))),
  //     betterPlayerDataSource: betterPlayerDataSource,
  //   );
  //   super.onInit();
  // }

  // checkPlaying({int? setVal}) async {
  //   if (setVal != null && setVal <= 0) {
  //     // await chewieController.seekTo(Duration(microseconds: 0));
  //     isPlaying.value = false;
  //   } else if (setVal != null && setVal > 0) {
  //     isPlaying.value = true;
  //   } else {
  //     isPlaying.value = !isPlaying.value;
  //   }
  // }

  // fadeIn() {
  //   Future.delayed(Duration(milliseconds: 200), () {
  //     widgetOpacity.value = 1.0;
  //   });
  // }

  // fadeOut() {
  //   if (clicksScreenPivot.value.isEven) {
  //     print("in");
  //     Future.delayed(Duration(milliseconds: 50), () {
  //       controlOpacity.value = 0.0;
  //       print("over");
  //     });
  //   } else {
  //     controlOpacity.value = 1.0;
  //   }
  //   clicksScreenPivot.value = clicksScreenPivot.value + 1;
  // }

}
