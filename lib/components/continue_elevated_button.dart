// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:four_musti/utils/themes.dart';

Widget continueElevatedButton(BuildContext context,
    {required String text, Function()? onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w800,
      ),
    ),
    style: ElevatedButton.styleFrom(
      elevation: 0.0,
      shadowColor: Colors.transparent,
      primary: pinkColorI,
      fixedSize: Size(MediaQuery.of(context).size.width - 30, 48),
    ),
  );
}
