// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:four_musti/controller/home_controller.dart';
import 'package:four_musti/utils/themes.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
/*
 int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
*/

Widget bottomNavBar(
    BuildContext context,
    List<Widget> buildScreens,
    List<PersistentBottomNavBarItem>? navBarsItems,
    PersistentTabController controller) {
  // HomeController hc = Get.put(HomeController());
  return PersistentTabView(
    context,
    controller: controller,
    screens: buildScreens,
    items: navBarsItems,
    confineInSafeArea: true,
    backgroundColor: Colors.black.withOpacity(0.3), // Default is Colors.white.
    handleAndroidBackButtonPress: true, // Default is true.
    resizeToAvoidBottomInset:
        true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
    stateManagement: true, // Default is true.
    hideNavigationBarWhenKeyboardShows:
        true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
    decoration: NavBarDecoration(
      borderRadius: BorderRadius.circular(0),
      colorBehindNavBar: Colors.transparent,
    ),
    popAllScreensOnTapOfSelectedTab: true,
    popActionScreens: PopActionScreensType.all,
    itemAnimationProperties: ItemAnimationProperties(
      // Navigation Bar's items animation properties.
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    ),
    screenTransitionAnimation: ScreenTransitionAnimation(
      // Screen transition animation on change of selected tab.
      animateTabTransition: true,
      curve: Curves.ease,
      duration: Duration(milliseconds: 200),
    ),
    navBarStyle:
        NavBarStyle.style12, // Choose the nav bar style with this property.
  );

  // return CurvedNavigationBar(
  //   index: 0,
  //   height: 52.0,
  //   items: <Widget>[
  //     Icon(
  //       Icons.home,
  //       size: 28,
  //       color: splashTextColor,
  //     ),
  //     Icon(
  //       Icons.search,
  //       size: 28,
  //       color: splashTextColor,
  //     ),
  //     Icon(
  //       Icons.add,
  //       size: 28,
  //       color: splashTextColor,
  //     ),
  //     Icon(
  //       Icons.message,
  //       size: 28,
  //       color: splashTextColor,
  //     ),
  //     Icon(
  //       Icons.perm_identity,
  //       size: 28,
  //       color: splashTextColor,
  //     ),
  //   ],
  //   color: primaryColorI,
  //   buttonBackgroundColor: lightVioletI,
  //   backgroundColor: lightVioletII,
  //   animationCurve: Curves.easeInOut,
  //   animationDuration: Duration(milliseconds: 600),
  //   onTap: (index) {
  //     hc.page.value = index;
  //   },
  //   letIndexChange: (index) => true,
  // );
}
