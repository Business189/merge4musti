// ignore_for_file: prefer_const_constructors

import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four_musti/controller/home_controller.dart';
import 'package:four_musti/utils/constants.dart';
import 'package:four_musti/utils/temp_data.dart';
import 'package:four_musti/utils/themes.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  HomeController hc = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    hc.changeRotation();
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: hc.videoPageController,
        onPageChanged: hc.selectedPage,
        itemCount: tempUserVideoData.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 9 / 16,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: BetterPlayerListVideoPlayer(
                      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
                          tempUserVideoData[index].videoUrl!),
                      configuration: BetterPlayerConfiguration(
                          aspectRatio: MediaQuery.of(context).size.aspectRatio,
                          autoPlay: true,
                          controlsConfiguration:
                              BetterPlayerControlsConfiguration(
                            showControls: false,
                          )),
                      key: Key(tempUserVideoData.hashCode.toString()),
                      playFraction: 0.8,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                // height: double.infinity,
                color: Colors.black26,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Following",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "|",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("For You",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white)),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            children: [
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.6),
                              Text("@${tempUserVideoData[index].username!}"),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("#avicii"),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("#avicii"),
                            ],
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 3,
                              ),
                              // SvgPicture.asset(
                              //   "assets/images/User.svg",
                              // ),
                              CachedNetworkImage(
                                imageUrl:
                                    tempUserVideoData[index].othersProfilePic ??
                                        defaultProfilePic,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: primaryColorII.withOpacity(0.3),
                                    ),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: lightVioletII,
                                    ),
                                    width: 40,
                                    height: 40,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: primaryColorII,
                                      ),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.account_circle_rounded),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Obx(() {
                                return InkWell(
                                  onTap: () {
                                    hc.isLiked.value = !hc.isLiked.value;
                                  },
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        hc.isLiked.value
                                            ? "assets/images/Heart_icon.svg"
                                            : "assets/images/Heart.svg",
                                        width: 30,
                                        height: 30,
                                      ),
                                      Text(
                                        tempUserVideoData[index].likes ?? '0',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: splashTextColor),
                                      )
                                    ],
                                  ),
                                );
                              }),
                              const SizedBox(
                                height: 30,
                              ),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/Message.svg",
                                    width: 30,
                                    height: 30,
                                  ),
                                  Text(
                                    tempUserVideoData[index].totalComments ??
                                        '0',
                                    style: TextStyle(
                                        fontSize: 14, color: splashTextColor),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/Share.svg",
                                    width: 30,
                                    height: 30,
                                  ),
                                  Text(
                                    tempUserVideoData[index].totalShare ?? '0',
                                    style: TextStyle(
                                        fontSize: 14, color: splashTextColor),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),

                              Obx(() {
                                return AnimatedRotation(
                                  turns: hc.turns.value,
                                  duration: Duration(seconds: 60),
                                  child: SvgPicture.asset(
                                    "assets/images/disk_1.svg",
                                    color: primaryColorI,
                                    width: 50,
                                    height: 50,
                                  ),
                                );
                              })
                              // SvgPicture.asset(
                              //   "assets/images/disk_1.svg",
                              //   width: 50,
                              //   height: 50,
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      // body: Container(
      //   padding: const EdgeInsets.only(left: 16, right: 16),
      //   // height: double.infinity,
      //   width: double.infinity,
      //   color: Colors.black26,
      //   child: Column(
      //     children: [
      //       const SizedBox(
      //         height: 60,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: const [
      //           Text(
      //             "Following",
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           Text(
      //             "|",
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           Text(
      //             "For You",
      //           ),
      //         ],
      //       ),
      //       Stack(
      //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Align(
      //             alignment: Alignment.bottomLeft,
      //             child: Column(
      //               children: [
      //                 SizedBox(
      //                     height: MediaQuery.of(context).size.height / 1.6),
      //                 const Text("@karenne"),
      //                 const SizedBox(
      //                   height: 10,
      //                 ),
      //                 const Text("#avicii"),
      //                 const SizedBox(
      //                   height: 10,
      //                 ),
      //                 const Text("#avicii"),
      //               ],
      //             ),
      //           ),
      //           Align(
      //             alignment: Alignment.bottomRight,
      //             child: Column(
      //               children: [
      //                 SizedBox(
      //                   height: MediaQuery.of(context).size.height / 3,
      //                 ),
      //                 SvgPicture.asset(
      //                   "assets/images/User.svg",
      //                 ),
      //                 const SizedBox(
      //                   height: 30,
      //                 ),
      //                 SvgPicture.asset(
      //                   "assets/images/Heart.svg",
      //                 ),
      //                 const SizedBox(
      //                   height: 30,
      //                 ),
      //                 SvgPicture.asset(
      //                   "assets/images/Message.svg",
      //                 ),
      //                 const SizedBox(
      //                   height: 30,
      //                 ),
      //                 SvgPicture.asset(
      //                   "assets/images/Share.svg",
      //                 ),
      //                 const SizedBox(
      //                   height: 30,
      //                 ),
      //                 SvgPicture.asset(
      //                   "assets/images/Disc.svg",
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
