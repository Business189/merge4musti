import "package:flutter/material.dart";
import 'package:four_musti/utils/themes.dart';

Widget next(BuildContext context,
    {required String text, Function()? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Ink(
      decoration: BoxDecoration(gradient: linearGradientI),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w800,
        ),
      ),
      // style: ElevatedButton.styleFrom(
      //   elevation: 0.0,
      //   shadowColor: Colors.transparent,
      //   primary: const Color(0xFF7B52AB),
      //   fixedSize: Size(MediaQuery.of(context).size.width - 60, 48),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20.0),
      //   ),
      // ),
    ),
  );
}
