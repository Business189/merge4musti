// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four_musti/controller/fetch_agora_data.dart';
import 'package:four_musti/controller/others_profile_controller.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../widgets/marquee.dart';
import '../widgets/wallet_dialog.dart';
import 'my_profile.dart';
import 'othertabbar/other_liked_video_tab.dart';
import 'othertabbar/other_video_tab.dart';

class OthersProfilePage extends StatelessWidget {
  OthersProfilePage({Key? key}) : super(key: key);
  FetchAgoraData fad = Get.put(FetchAgoraData());
  @override
  Widget build(BuildContext context) {
    OtherProfileController opc = Get.put(OtherProfileController());
    return Container(
      // padding: EdgeInsets.only(bottom: 64.0),
      decoration: BoxDecoration(color: Colors.white),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: appBarBackgroundColor,
          elevation: 1.0,
          title: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "kyliejenner",
              style: TextStyle(
                color: textColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
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
                                      imageUrl:
                                          'https://cdn.shopify.com/s/files/1/0067/4555/5015/files/Kylie-intro.jpg?1024',
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
                                        '@kylieppuiopp',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: disabledTextColor),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 6),
                                    child: Row(children: [
                                      cardII(
                                          icon: Icons.diamond_sharp,
                                          t1: '180K'),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      cardII(
                                          icon: Icons.whatshot_outlined,
                                          t1: '700M'),
                                    ]),
                                  )
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        cardI(t1: '6831', t2: 'Videos'),
                                        cardI(t1: '314M', t2: 'Followers'),
                                        cardI(t1: '81', t2: 'Following'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        aboutMe(
                                            about:
                                                "Kylie Kristen Jenner is an American media personality, socialite, model, and businesswoman.",
                                            hashtags: [
                                              'womenatbusiness',
                                              'fashionmodel',
                                              'girlboss',
                                              'femaleentreprenure',
                                            ],
                                            uniqueUID: '7984356'),
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
                                      flex: 5,
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
                                          'Follow',
                                          style: TextStyle(
                                              color: textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: InkWell(
                                        onTap: () async {
                                          EasyLoading.show(
                                              status: 'preparing...');
                                          await fad.fetchRTM();
                                          print(
                                              "RTM login credentials: ${fad.agoraRtmForUser.value.agoraToken} and ${fad.agoraRtmForUser.value.userId}");
                                          EasyLoading.dismiss();
                                          Get.toNamed("PRIVATE_CHAT");
                                        },
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
                                            'Message',
                                            style: TextStyle(
                                                color: textColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
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
            // SliverToBoxAdapter(
            //   child: Obx(() {
            //     return Visibility(
            //       visible: pc.isVisible.value,
            //       child: SizedBox(
            //         height: 210,
            //         child: ListView.builder(
            //           itemBuilder: (context, index) {
            //             return Row(
            //               crossAxisAlignment: CrossAxisAlignment.stretch,
            //               children: [
            //                 Container(
            //                   alignment: Alignment.center,
            //                   width: 140,
            //                   margin: EdgeInsets.only(
            //                       top: 10,
            //                       bottom: 10,
            //                       left: index == 0 ? 16 : 0,
            //                       right: index == 5 ? 16 : 0),
            //                   decoration: BoxDecoration(
            //                       color: appBarBackgroundColor,
            //                       borderRadius: BorderRadius.circular(6.0),
            //                       boxShadow: [
            //                         BoxShadow(
            //                           color: Colors.black.withOpacity(0.1),
            //                           blurRadius: 6,
            //                           offset: Offset(1, 1),
            //                         ),
            //                       ]),
            //                   child: Stack(
            //                     children: [
            //                       Align(
            //                         alignment: Alignment.topRight,
            //                         child: IconButton(
            //                             onPressed: () {},
            //                             icon: Icon(
            //                               Icons.close,
            //                               size: 18,
            //                               color: disabledTextColor,
            //                             )),
            //                       ),
            //                       Align(
            //                         alignment: Alignment.topCenter,
            //                         child: Container(
            //                           margin: EdgeInsets.only(top: 10),
            //                           child: CachedNetworkImage(
            //                             fit: BoxFit.cover,
            //                             imageUrl:
            //                                 'https://instagram.fgau1-3.fna.fbcdn.net/v/t51.2885-15/272199546_302803411815769_8501125292190720724_n.jpg?stp=dst-jpg_e35_s640x640_sh0.08&_nc_ht=instagram.fgau1-3.fna.fbcdn.net&_nc_cat=1&_nc_ohc=RaF87ER3JggAX9Naue1&edm=AABBvjUBAAAA&ccb=7-4&oh=00_AT_wS1I6KpcRPAvU4VAM6EXSXWBk5wd1jGwsXC8d2_n13A&oe=6224E7BC&_nc_sid=83d6030',
            //                             height: 87,
            //                             width: 87,
            //                             imageBuilder:
            //                                 (context, imageProvider) =>
            //                                     Container(
            //                               decoration: BoxDecoration(
            //                                 shape: BoxShape.circle,
            //                                 image: DecorationImage(
            //                                   image: imageProvider,
            //                                   fit: BoxFit.cover,
            //                                 ),
            //                               ),
            //                             ),
            //                             placeholder: (context, url) => Center(
            //                                 child: CircularProgressIndicator()),
            //                             errorWidget: (context, url, error) =>
            //                                 const Icon(
            //                               Icons.error,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                       Align(
            //                         alignment: Alignment.bottomCenter,
            //                         child: Column(
            //                           mainAxisSize: MainAxisSize.min,
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.center,
            //                           children: [
            //                             Row(
            //                               mainAxisAlignment:
            //                                   MainAxisAlignment.center,
            //                               children: [
            //                                 Expanded(
            //                                   child: Text(
            //                                     "ana_d_armas",
            //                                     maxLines: 1,
            //                                     textAlign: TextAlign.center,
            //                                     style: TextStyle(
            //                                       fontSize: 16,
            //                                       fontWeight: FontWeight.bold,
            //                                       overflow:
            //                                           TextOverflow.ellipsis,
            //                                     ),
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                             SizedBox(
            //                               height: 10,
            //                             ),
            //                             Text("suggested for you"),
            //                             SizedBox(
            //                               height: 10,
            //                             ),
            //                             Container(
            //                               margin: EdgeInsets.only(
            //                                   left: 10, right: 10),
            //                               padding: EdgeInsets.all(6),
            //                               decoration: BoxDecoration(
            //                                   color: Colors.blue,
            //                                   borderRadius:
            //                                       BorderRadius.circular(6)),
            //                               child: Row(
            //                                 mainAxisAlignment:
            //                                     MainAxisAlignment.center,
            //                                 children: [
            //                                   Text("Follow",
            //                                       textAlign: TextAlign.center,
            //                                       style: TextStyle(
            //                                         color: Colors.white,
            //                                         fontWeight: FontWeight.bold,
            //                                       )),
            //                                 ],
            //                               ),
            //                             ),
            //                             SizedBox(
            //                               height: 10,
            //                             ),
            //                           ],
            //                         ),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   width: index == 5 ? 0 : 10,
            //                 )
            //               ],
            //             );
            //           },
            //           itemCount: 6,
            //           scrollDirection: Axis.horizontal,
            //         ),
            //       ),
            //     );
            //   }),
            // ),

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
                          color: opc.index.value == 0
                              ? textColor
                              : disabledTextColor,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.favorite,
                          size: 24,
                          color: opc.index.value == 1
                              ? textColor
                              : disabledTextColor,
                        ),
                      ),
                    ],
                    controller: opc.tabController,
                  ),
                );
              }),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: opc.tabController,
                children: [
                  OtherVideoTab(),
                  OtherLikedVideoTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
