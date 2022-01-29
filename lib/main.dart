import 'package:flutter/material.dart';
import 'package:four_musti/views/account_details/account_details.dart';
import 'package:four_musti/views/login/login.dart';
import 'package:four_musti/views/onboarding/onboarding_page.dart';
import 'package:four_musti/views/splashScreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '4musti',
      theme: ThemeData(),
      // home: const SplashScreen(),
      // home: const Onboarding(),
      home: const Login(),
      // home: AccountDetails(),
    );
  }
}
