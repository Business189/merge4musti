// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unnecessary_string_interpolations

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four_musti/model/user_model.dart';
import 'package:four_musti/utils/functions.dart';
import 'package:four_musti/utils/temp_data.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../controller/profile_controllers.dart';
import '../widgets/marquee.dart';
// import '../../widgets/sliver_app_deligate.dart';
import '../widgets/wallet_dialog.dart';
import 'tabbar/like_video_tab.dart';
import 'tabbar/my_video_tab.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context);
    print(Functions.uniqueIDGenerator());
    ProfileController pc = Get.put(ProfileController());

    _showModalBottomSheetI() {
      return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            height: 100,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  "Connect With",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/instagram.svg",
                        color: Color(0xFFE4405F),
                        width: 40,
                        height: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/whatsapp.svg",
                        color: Color(0xFF25D366),
                        width: 40,
                        height: 40,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/facebook.svg",
                        color: Color(0xFF1877F2),
                        width: 40,
                        height: 40,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Container(
      // padding: EdgeInsets.only(bottom: 64.0),
      decoration: BoxDecoration(color: Colors.white),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarBackgroundColor,
          elevation: 1.0,
          title: InkWell(
            onTap: () {
              _showModalBottomSheetI();
            },
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Text(
                    "${pc.ac.userModel.value!.username}",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_drop_down_sharp,
                      size: 22,
                    ),
                    color: textColor,
                  )
                ],
              ),
            ),
          ),
          actions: [
            //coin
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => walletDialog());
                },
                icon: SvgPicture.asset(
                  'assets/images/coin.svg',
                  width: 24,
                  height: 24,
                )),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                size: 24,
                color: textColor,
              ),
            ),
          ],
        ),
        // drawer: Drawer(),
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      // margin: EdgeInsets.only(top: 120),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    // decoration: BoxDecoration(
                                    //     border: Border.all(
                                    //         color: Colors.black)),
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: pc
                                              .ac.userModel.value?.profilePic ??
                                          "https://www.kindpng.com/picc/m/495-4952535_create-digital-profile-icon-blue-user-profile-icon.png",
                                      height: 90,
                                      width: 90,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFFD95BF0),
                                            width: 2.0,
                                          ),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.error,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 90,
                                    alignment: Alignment.center,
                                    // decoration: BoxDecoration(
                                    //     border: Border.all(
                                    //         color: Colors.black)),
                                    child: MarqueeWidget(
                                      child: Text(
                                        '${pc.ac.userModel.value!.displayName}',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: disabledTextColor),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // decoration: BoxDecoration(
                                    //     border:
                                    //         Border.all(color: Colors.black)),
                                    margin: EdgeInsets.only(top: 6),
                                    child: Column(
                                      children: [
                                        Row(children: [
                                          cardII(
                                              icon: Icons.diamond_sharp,
                                              t1:
                                                  '${pc.ac.userModel.value?.totalDiamonds ?? 0}',
                                              backgroundColor:
                                                  mainColorNew.withOpacity(0.2),
                                              foregroundColor: mainColorNew),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          cardII(
                                              icon: Icons.whatshot_outlined,
                                              t1:
                                                  '${pc.ac.userModel.value?.totalFlames ?? 0}',
                                              backgroundColor:
                                                  mainColorNew.withOpacity(0.2),
                                              foregroundColor: mainColorNew),
                                        ]),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        cardIII(
                                            t1: 'Level',
                                            t2:
                                                '${pc.ac.userModel.value?.level ?? 0}',
                                            backgroundColor:
                                                mainColorNew.withOpacity(0.2),
                                            foregroundColor: mainColorNew),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Obx(() {
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          cardI(
                                              t1: '${pc.ac.userModel.value?.totalVideos ?? 0}',
                                              t2: 'Videos'),
                                          InkWell(
                                            onTap: () {},
                                            child: cardI(
                                                t1: '${pc.ac.userModel.value?.totalFollowers ?? 0}',
                                                t2: 'Followers'),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: cardI(
                                                t1: '${pc.ac.userModel.value?.totalFollowings ?? 0}',
                                                t2: 'Following'),
                                          ),
                                        ],
                                      );
                                    }),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Obx(() {
                                          return aboutMe(
                                              about:
                                                  pc.ac.userModel.value?.bio ??
                                                      "",
                                              hashtags: pc.ac.userModel.value
                                                      ?.hashtags ??
                                                  [],
                                              uniqueUID: pc.ac.userModel.value
                                                  ?.uniqueYouId);
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          // Spacer(),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: profileBackColor,
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 1,
                                                  offset: Offset(1.5, 1.5))
                                            ]),
                                        child: Text(
                                          'Edit Profile',
                                          style: TextStyle(
                                              color: textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          pc.isVisible.value =
                                              !pc.isVisible.value;
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 2,
                                            right: 2,
                                          ),
                                          decoration: BoxDecoration(
                                              color: profileBackColor,
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    blurRadius: 1,
                                                    offset: Offset(1.5, 1.5))
                                              ]),
                                          child: Obx(() {
                                            return Icon(
                                              pc.isVisible.value == true
                                                  ? Icons.person_add_alt_1
                                                  : Icons.person_add_alt,
                                              size: 20,
                                              color: textColor,
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                    // Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //follow card
            SliverToBoxAdapter(
              child: Obx(() {
                return Visibility(
                  visible: pc.isVisible.value,
                  child: SizedBox(
                    height: 210,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 140,
                              margin: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                  left: index == 0 ? 16 : 0,
                                  right: index == 5 ? 16 : 0),
                              decoration: BoxDecoration(
                                  color: appBarBackgroundColor,
                                  borderRadius: BorderRadius.circular(6.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 6,
                                      offset: Offset(1, 1),
                                    ),
                                  ]),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.close,
                                          size: 18,
                                          color: disabledTextColor,
                                        )),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed("/OTHERS_PROFILE_PAGE");
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              suggestedList[index].profilePic!,
                                          height: 87,
                                          width: 87,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                            Icons.error,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                suggestedList[index].name!,
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("suggested for you"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            pc.checkFollowing(index);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10),
                                            padding: EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Obx(() {
                                                  return Text(
                                                    !pc.following[index]
                                                        ? "Follow"
                                                        : "Following",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  );
                                                }),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: index == 5 ? 0 : 10,
                            )
                          ],
                        );
                      },
                      itemCount: suggestedList.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                );
              }),
            ),

            SliverToBoxAdapter(
              child: Obx(() {
                return Container(
                  padding: EdgeInsets.only(bottom: 1),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0, color: Colors.black.withOpacity(0.15)),
                    ),
                  ),
                  child: TabBar(
                    indicatorColor: textColor,
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 2.0),
                        insets: EdgeInsets.symmetric(horizontal: 16.0)),
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.grid_on,
                          size: 24,
                          color: pc.index.value == 0
                              ? textColor
                              : disabledTextColor,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.favorite,
                          size: 24,
                          color: pc.index.value == 1
                              ? textColor
                              : disabledTextColor,
                        ),
                      ),
                    ],
                    controller: pc.tabController,
                  ),
                );
              }),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: pc.tabController,
                children: [
                  MyVideoTab(),
                  LikedVideoTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Container cardI({String? t1, String? t2}) {
  return Container(
    // width:
    padding: EdgeInsets.all(1),
    // margin: EdgeInsets.only(right: 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
    child: Column(
      children: [
        Text(
          t1 ?? '',
          style: TextStyle(
            fontSize: 18,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          t2 ?? '',
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget aboutMe({String? about, List<String>? hashtags, String? uniqueUID}) {
  return Expanded(
    child: Container(
      // width:
      padding: EdgeInsets.all(1),
      // margin: EdgeInsets.only(right: 20),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(3),
      //     border: Border.all(color: Colors.tealAccent)),
      child: Column(
        children: [
          Text(
            about ?? '',
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          hashtags != null
              ? Wrap(
                  children: List.generate(
                    hashtags == null ? 0 : hashtags.length,
                    (index) => Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Text(
                        '#${hashtags[index]}',
                        style: TextStyle(
                            fontSize: 14,
                            color: hashtagColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          uniqueUID != null
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Unique Id: ",
                        style: TextStyle(
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "4M-" + uniqueUID,
                        style: TextStyle(
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    ),
  );
}

Container cardII({
  String? t1,
  IconData? icon,
  Color? backgroundColor,
  Color? foregroundColor,
}) {
  return Container(
    padding: EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 2),
    // margin: EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor ?? Colors.white),
    child: Row(
      children: [
        Icon(
          icon ?? Icons.diamond,
          color: foregroundColor ?? textColor,
          size: 12,
        ),
        SizedBox(width: 2),
        Text(
          t1 ?? '0',
          style: TextStyle(fontSize: 10, color: foregroundColor ?? textColor),
        ),
      ],
    ),
  );
}

Container cardIII({
  String? t1,
  String? t2,
  Color? backgroundColor,
  Color? foregroundColor,
}) {
  return Container(
    padding: EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 2),
    // margin: EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor ?? Colors.white),
    child: Row(
      children: [
        Text(
          t1 ?? 'label',
          style: TextStyle(fontSize: 10, color: foregroundColor ?? textColor),
        ),
        SizedBox(width: 2),
        Text(
          t2 ?? '0',
          style: TextStyle(fontSize: 10, color: foregroundColor ?? textColor),
        ),
      ],
    ),
  );
}
