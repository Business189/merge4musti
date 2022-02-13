// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four_musti/controller/initial_follow_controller.dart';
import 'package:four_musti/utils/constants.dart';
import 'package:four_musti/utils/temp_data.dart';
import 'package:four_musti/utils/themes.dart';
import 'package:get/get.dart';

class InitialFollow extends StatelessWidget {
  InitialFollow({Key? key}) : super(key: key);
  // FollowController followController = Get.put(FollowController());
  @override
  Widget build(BuildContext context) {
    print("Device Width: $deviceWidth and Device Height: $deviceHeight");
    return Container(
      decoration: BoxDecoration(gradient: splashGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: deviceHeight * 0.10),
              Row(
                children: [
                  Text(
                    "Top Tranding Stars",
                    style: TextStyle(
                        fontSize: 20,
                        color: splashTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.offNamed("HOME");
                    },
                    child: Row(
                      children: [
                        Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: 14,
                            color: lightVioletII,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          "assets/images/skip.svg",
                          width: 10,
                          height: 10,
                          color: lightVioletII,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: deviceHeight * 0.023,
              ),
              SizedBox(
                height: deviceHeight * 0.75,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    childAspectRatio:
                        ((deviceWidth / 4) + 20) / (deviceHeight / 5 + 40),
                    mainAxisSpacing: 10,
                    shrinkWrap: false,
                    children: List.generate(
                        topFollowingList.length,
                        (index) => card(
                              profilePic: topFollowingList[index].profilePic,
                              name: topFollowingList[index].name,
                              uid: topFollowingList[index].uid,
                              index: index,
                            )),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.offAllNamed('HOME');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      gradient: linearGradientI,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: splashTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Container card({String? profilePic, String? name, String? uid, int? index}) {
  double cardWidth = (deviceWidth / 4) + 20;
  double cardHeight = (deviceHeight / 5) + 30;
  FollowController fc = Get.put(FollowController());
  return Container(
    width: cardWidth,
    height: cardHeight,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: primaryColorI,
        boxShadow: [
          BoxShadow(
            offset: Offset(2.5, 2.5),
            blurRadius: 6.0,
            color: primaryColorII.withOpacity(0.07),
            spreadRadius: 5,
          ),
        ]),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 10,
        ),
        CachedNetworkImage(
          imageUrl: profilePic ?? defaultProfilePic,
          imageBuilder: (context, imageProvider) => Container(
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: primaryColorII.withOpacity(0.3),
              ),
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightVioletII,
              ),
              width: 90,
              height: 90,
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
        SizedBox(
          height: 10,
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Text(
              name ?? "4Musti Star",
              overflow: TextOverflow.fade,
              style: TextStyle(
                color: splashTextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          uid ?? "",
          style: TextStyle(
            color: lightVioletII,
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            fc.checkFollowing(index!);
          },
          child: Container(
            width: cardWidth * 0.65,
            // height: cardHeight * 0.15,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: pinkColorI,
                border: Border.all(color: primaryColorII.withOpacity(0.15)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2.5, 2.5),
                    blurRadius: 6.0,
                    color: primaryColorII.withOpacity(0.15),
                  )
                ]),
            child: Center(
              child: Obx(() {
                return Text(
                  !fc.following[index!] ? "Follow" : "Following",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                );
              }),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
