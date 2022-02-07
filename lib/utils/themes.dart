// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Color primaryColorI = Color(0xFF9D53E8); //Light
Color primaryColorII = Color(0xFF260D45); //Dark
Color splashTextColor = Color(0xFFFFFFFF);
Color hideColor = Colors.blueGrey.shade200;

LinearGradient splashGradient = LinearGradient(colors: [
  primaryColorI,
  primaryColorII,
], begin: Alignment.topRight, end: Alignment.bottomLeft);

LinearGradient linearGradientI = LinearGradient(
  colors: [
    Color(0xFFDD64DE),
    Color(0xFF9768D1),
  ],
);
