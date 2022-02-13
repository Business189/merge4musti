// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four_musti/components/bottom_navbar.dart';
import 'package:four_musti/controller/home_controller.dart';
import 'package:four_musti/controller/landing_page_controller.dart';
import 'package:four_musti/utils/themes.dart';
import 'package:four_musti/views/indexedPage/create_page.dart';
import 'package:four_musti/views/indexedPage/home.dart';
import 'package:four_musti/views/indexedPage/inbox.dart';
import 'package:four_musti/views/indexedPage/profile.dart';
import 'package:four_musti/views/indexedPage/search.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Home extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

/*
  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                ),
                label: 'Search',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.add,
                    size: 20.0,
                  ),
                ),
                label: '',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.message,
                    size: 20.0,
                  ),
                ),
                label: 'Inbox',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.person,
                    size: 20.0,
                  ),
                ),
                label: 'Me',
                backgroundColor: Colors.black,
              ),
            ],
          ),
        )));
  }

  */

  @override
  Widget build(BuildContext context) {
    // final LandingPageController landingPageController =
    //     Get.put(LandingPageController(), permanent: false);
    HomeController hc = Get.put(HomeController());
    return SafeArea(
        child: Scaffold(
      // bottomNavigationBar:
      //     buildBottomNavigationMenu(context, landingPageController),
      bottomNavigationBar:
          bottomNavBar(context, _buildScreens(), navBarsItems(), hc.controller),
      body: Obx(() => IndexedStack(
            // index: landingPageController.tabIndex.value,
            index: hc.controller.index,
            children: [
              HomePage(),
              SearchPage(),
              CreatePage(),
              InboxPage(),
              ProfilePage(),
            ],
          )),
    ));
  }
}

List<Widget> _buildScreens() {
  return [
    HomePage(),
    SearchPage(),
    CreatePage(),
    InboxPage(),
    ProfilePage(),
  ];
}

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      activeColorPrimary: primaryColorI,
      inactiveColorPrimary: lightVioletII,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.search),
      activeColorPrimary: primaryColorI,
      inactiveColorPrimary: lightVioletII,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.add),
      activeColorPrimary: primaryColorI,
      inactiveColorPrimary: lightVioletII,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.bubble_left),
      activeColorPrimary: primaryColorI,
      inactiveColorPrimary: lightVioletII,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.person),
      activeColorPrimary: primaryColorI,
      inactiveColorPrimary: lightVioletII,
    ),
  ];
}
