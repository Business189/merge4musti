// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

Widget plainTextField(
    {String? labelText,
    IconData? suffixicon,
    String? url = "",
    TextEditingController? controller,
    TextInputType? inputType,
    Function(String)? onChanged,
    Function()? onIconPressed,
    bool? isEnable = true}) {
  return TextField(
      keyboardType: inputType,
      onChanged: onChanged,
      enabled: isEnable,
      controller: controller,
      style: TextStyle(
        height: 1,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        // fillColor: Colors.white,
        filled: true,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        suffixIcon: url == ""
            ? IconButton(
                icon: Icon(
                  suffixicon,
                  color: Color(0xFF42C1DA),
                ),
                onPressed: onIconPressed,
              )
            : SvgPicture.asset(url!),
      ));
}
