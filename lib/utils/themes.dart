// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Color primaryColorI = Color(0xFF9D53E8); //Light
Color primaryColorII = Color(0xFF260D45); //Dark
Color splashTextColor = Color(0xFFFFFFFF);
Color hideColor = Colors.blueGrey.shade200;
Color pinkColorI = Color(0xFFDD64DE);
Color lightVioletI = Color(0xFF9768D1);
Color lightVioletII = Color(0xFFC1A4E3);

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

LinearGradient linearGradientII = LinearGradient(
  colors: [
    Color(0xFF623E8D),
    Color(0xFF8E43E0),
  ],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
