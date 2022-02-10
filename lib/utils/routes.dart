// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:four_musti/views/account_details/account_details.dart';
import 'package:four_musti/views/indexedPage/create.dart';
import 'package:four_musti/views/initialFollow/initial_follow.dart';
import 'package:four_musti/views/login/login.dart';
import 'package:four_musti/views/login/login_with_phone.dart';
import 'package:four_musti/views/onboarding/onboarding_page.dart';
import 'package:four_musti/views/splashScreen/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage> Routes = [
  GetPage(name: "/SPLASH", page: () => SplashScreen()),
  GetPage(name: "/ONBOARDING", page: () => Onboarding()),
  GetPage(name: "/HOME", page: () => Home()),
  GetPage(name: "/ACCOUNT_DETAILS", page: () => AccountDetails()),
  GetPage(name: "/LOGIN", page: () => Login()),
  GetPage(name: "/MOBILE_LOGIN", page: () => MobileLogin()),
  GetPage(name: "/INITIAL_FOLLOW", page: () => InitialFollow()),
];
