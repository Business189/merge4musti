// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:four_musti/utils/themes.dart';

Widget gradientButton(BuildContext context,
    {required String text, Function()? onPressed, double? cornerRadius}) {
  return DecoratedBox(
    decoration: BoxDecoration(
      gradient: linearGradientI,
      borderRadius: BorderRadius.circular(
        cornerRadius ?? 4,
      ),
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'Cairo',
            color: Colors.white,
            fontWeight: FontWeight.w700),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        onSurface: Colors.transparent,
        shadowColor: Colors.transparent,
        fixedSize: Size(MediaQuery.of(context).size.width - 30, 48),
      ),
    ),
  );
}
