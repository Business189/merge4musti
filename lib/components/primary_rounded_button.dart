import "package:flutter/material.dart";

Widget roundedElevatedButton(BuildContext context,
    {required String text, Function()? onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: const TextStyle(
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w800,
      ),
    ),
    style: ElevatedButton.styleFrom(
      elevation: 0.0,
      shadowColor: Colors.transparent,
      primary: const Color(0xFF9768D1),
      fixedSize: Size(MediaQuery.of(context).size.width, 48),
      shape: const RoundedRectangleBorder(
        // topleft and topright border radius
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        // borderRadius: BorderRadius.,
      ),
    ),
  );
}
