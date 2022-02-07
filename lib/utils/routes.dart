// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:four_musti/views/indexedPage/create.dart';
import 'package:four_musti/views/onboarding/onboarding_page.dart';
import 'package:four_musti/views/splashScreen/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage> Routes = [
  GetPage(name: "/SPLASH", page: () => SplashScreen()),
  GetPage(name: "/ONBOARDING", page: () => Onboarding()),
  GetPage(name: "/HOME", page: () => Home()),
];
