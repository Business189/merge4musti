// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_musti/utils/themes.dart';

Widget plainTextField({
  String? labelText,
  IconData? suffixicon,
  String? url = "",
  TextEditingController? controller,
  TextInputType? inputType,
  Function(String)? onChanged,
  Function()? onIconPressed,
  bool? isEnable = true,
  IconData? prefixIcon,
  bool? isPassword,
}) {
  return TextField(
    keyboardType: inputType,
    onChanged: onChanged,
    enabled: isEnable,
    obscureText: isPassword ?? false,
    controller: controller,
    style: TextStyle(
      height: 1,
      color: Colors.white,
    ),
    decoration: InputDecoration(
      // fillColor: Colors.white,
      filled: false,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColorI,
          // width: 0.0,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColorI,
        ),
        // borderRadius: BorderRadius.circular(4),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 14,
      ),
      isDense: true,
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 16),
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: lightVioletII, size: 22)
          : null,
      suffixIcon: url == ""
          ? IconButton(
              icon: Icon(
                suffixicon,
                color: lightVioletII,
                size: 22,
              ),
              onPressed: onIconPressed,
            )
          : SvgPicture.asset(url!),
    ),
    cursorColor: Colors.white.withOpacity(0.9),
    cursorWidth: 2.5,
  );
}
