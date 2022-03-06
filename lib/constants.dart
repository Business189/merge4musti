import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'views/profile/my_profile.dart';

List pages = [
  MyProfilePage(),
];

// SHARED PREFERENCE
final box = GetStorage();

// COLORS
const backgroundColor = Color.fromARGB(255, 42, 42, 42);
// var buttonColor = Colors.red[400];
var buttonColor = Color.fromARGB(255, 162, 0, 255);
const borderColor = Colors.grey;

// FIREBASE

//profile colors
Color profileBackColor = Color(0xFFF2F2F2);
Color appBarBackgroundColor = Colors.white;
Color profileSecondaryColor = Color(0xFF010110);
Color disabledTextColor = Color(0xFF868686);
Color mainColor = Color(0xF66200FF);
Color textColor = Color(0xFF272727);
Color hashtagColor = Color(0xFF0444A5);

LinearGradient walletCardColor = LinearGradient(
  colors: [
    Colors.blue,
    Colors.blue.shade300,
  ],
);

Color walletDialogboxBackground = Colors.white;
