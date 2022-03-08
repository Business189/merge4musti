// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:four_musti/root.dart';
import 'package:four_musti/utils/constants.dart';
import 'package:four_musti/views/account_details/account_details.dart';
import 'package:four_musti/views/indexedPage/create.dart';
import 'package:four_musti/views/initialFollow/initial_follow.dart';
import 'package:four_musti/views/login/login.dart';
import 'package:four_musti/views/login/login_with_phone.dart';
import 'package:four_musti/views/onboarding/onboarding_page.dart';
import 'package:four_musti/views/splashScreen/splash_screen.dart';
import 'package:get/get.dart';

import '../views/chat/private_chat_page.dart';
import '../views/profile/my_profile.dart';
import '../views/profile/others_profile.dart';

List<GetPage> Routes = [
  GetPage(name: "/DEFAULT", page: () => box.hasData('uid') ? Root() : Login()),
  GetPage(name: "/ROOT", page: () => Root()),
  GetPage(name: "/LOGIN", page: () => Login()),
  GetPage(name: "/SPLASH", page: () => SplashScreen()),
  GetPage(name: "/ONBOARDING", page: () => Onboarding()),
  GetPage(name: "/HOME", page: () => Home()),
  GetPage(name: "/ACCOUNT_DETAILS", page: () => AccountDetails()),
  GetPage(name: "/MOBILE_LOGIN", page: () => MobileLogin()),
  GetPage(name: "/INITIAL_FOLLOW", page: () => InitialFollow()),
  GetPage(name: "/MY_PROFILE_PAGE", page: () => MyProfilePage()),
  GetPage(name: "/OTHERS_PROFILE_PAGE", page: () => OthersProfilePage()),
  GetPage(name: "/PRIVATE_CHAT", page: () => ChatPage()),
];
