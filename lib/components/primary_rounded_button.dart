import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

Widget roundedElevatedButton(BuildContext context,
    {required String text, Function()? onPressed, double? cornerRadius}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/logo_google.svg"),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
    // child: Text(
    //   text,
    //   style: const TextStyle(
    //     fontFamily: 'Cairo',
    //     fontWeight: FontWeight.w800,
    //     color: Colors.black,
    //   ),
    // ),
    style: ElevatedButton.styleFrom(
      elevation: 0.0,
      shadowColor: Colors.transparent,
      primary: Colors.white,
      fixedSize: Size(MediaQuery.of(context).size.width - 30, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius ?? 4),
      ),
    ),
  );
}
