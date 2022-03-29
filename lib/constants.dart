// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:four_musti/views/video_screen/add_video_screen.dart';
import 'package:get_storage/get_storage.dart';

import 'views/profile/my_profile.dart';

List<Widget> pages = [
  Text('Home Page'),
  Text('Search Page'),
  // SearchScreen(),
  AddVideoScreen(),
  Text('Inbox Screen'),
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

List<Map<String, dynamic>> giftList = [
  {
    "name": "duck",
    "url": "https://assets8.lottiefiles.com/packages/lf20_sd6ja104.json",
    "price": 10
  },
  {
    "name": "goodnight",
    "url": "https://assets5.lottiefiles.com/packages/lf20_gfpzv8fj.json",
    "price": 20
  },
  {
    "name": "ship",
    "url": "https://assets6.lottiefiles.com/packages/lf20_mxfb67ll.json",
    "price": 30
  },
  {
    "name": "coke",
    "url": "https://assets2.lottiefiles.com/packages/lf20_2j3tmv8q.json",
    "price": 40
  },
  {
    "name": "love in air",
    "url": "https://assets5.lottiefiles.com/packages/lf20_d2enk69l.json",
    "price": 50
  },
  {
    "name": "morning",
    "url": "https://assets5.lottiefiles.com/packages/lf20_kabq6mqb.json",
    "price": 60
  },
  {
    "name": "heart",
    "url": "https://assets8.lottiefiles.com/packages/lf20_ynhvfvk1.json",
    "price": 70
  },
  {
    "name": "fighter jet",
    "url": "https://assets1.lottiefiles.com/packages/lf20_r7p5ua5t.json",
    "price": 80
  },
  {
    "name": "couple in heart",
    "url": "https://assets10.lottiefiles.com/packages/lf20_ihzxb3tj.json",
    "price": 90
  },
];

List<Map<String, dynamic>> giftList2 = [
  {
    "name": "beer",
    "url": "assets/temp/59504-beer.json",
    "price": 10,
  },
  {
    "name": "plane",
    "url": "assets/temp/72442-3d-plane.json",
    "price": 20,
  },
  {
    "name": "coke",
    "url": "assets/temp/76132-classic-coke.json",
    "price": 30,
  },
  {
    "name": "love",
    "url": "assets/temp/95044-love-dog.json",
    "price": 40,
  },
];

String appID = "13fb36e3bc184dd5adca345b533fee90";
String urlAgoraRTC =
    "https://www.fourmusti.in/agora/agoraTokenGenerator/sample/RtcTokenBuilderSample.php";

String urlAgoraRTM =
    "https://fourmusti.in/agora/agoraTokenGenerator/sample/RtmTokenBuilderSample.php";
Color backgroundColorNew = Color(0xFFFFFFFF);
Color mainColorNew = Color(0xF66200FF);
Color accentColor = Colors.amber;

final DateTime constDate = DateTime(1970);

Map<String, String> StateNotation = {
  "1": "CONNECTION_STATE_DISCONNECTED",
  "2": "CONNECTION_STATE_CONNECTING",
  "3": "CONNECTION_STATE_CONNECTED",
  "4": "CONNECTION_STATE_RECONNECTING",
  "5": "CONNECTION_STATE_ABORTED",
};

Map<String, String> ReasonNotation = {
  "1": "CONNECTION_CHANGE_REASON_LOGIN",
  "2": "CONNECTION_CHANGE_REASON_LOGIN_SUCCESS",
  "3": "CONNECTION_CHANGE_REASON_LOGIN_FAILURE",
  "4": "CONNECTION_CHANGE_REASON_LOGIN_TIMEOUT",
  "5": "CONNECTION_CHANGE_REASON_INTERRUPTED",
  "6": "CONNECTION_CHANGE_REASON_LOGOUT",
  "7": "CONNECTION_CHANGE_REASON_BANNED_BY_SERVER",
  "8": "CONNECTION_CHANGE_REASON_REMOTE_LOGIN",
};

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
