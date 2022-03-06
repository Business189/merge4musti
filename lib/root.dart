// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:four_musti/controller/auth.dart';
import 'package:four_musti/model/user_model.dart';
import 'package:four_musti/views/indexedPage/home.dart';
import 'package:four_musti/views/login/login.dart';
import 'package:four_musti/views/splashScreen/splash_screen.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();
  String? activeTime = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return user == null
        ? Login()
        : FutureBuilder<UserModel?>(
            future: authController.fetchUserData(),
            builder:
                (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return SplashScreen(); // loading screen...
                default:
                  if (snapshot.hasError) {
                    return const Center(
                        child: Text('Error: Please restart the APP'));
                  } else {
                    authController.userModel.value = snapshot.data!;
                    authController.storeInSharedPreference();
                    return HomePage();
                  }
                // return Text('Result: ${snapshot.data?.displayName}');
              }
            },
          );
  }
}
