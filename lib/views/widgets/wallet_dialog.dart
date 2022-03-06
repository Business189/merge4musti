// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';

Widget walletDialog() {
  double dialogBoxHeight = 380;
  double dialogBoxWidth = 300;
  double tileHeight = dialogBoxHeight / 100;
  double tileWidth = dialogBoxWidth / 100;
  int coins = 50;
  return Dialog(
    backgroundColor: walletDialogboxBackground,
    elevation: 1,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)), //this right here
    child: Container(
      width: dialogBoxWidth,
      height: dialogBoxHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6)),
            child: Container(
              height: dialogBoxHeight * 0.4,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue.shade300,
                  Colors.blue,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/coin.svg',
                    width: tileWidth * 24,
                    height: tileHeight * 24,
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            child: Container(
              height: dialogBoxHeight * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: tileHeight * 5,
                        ),
                        Text(
                          'Success !!',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: tileHeight * 5,
                        ),
                        Text(
                          'You Received ₹ $coins.',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: tileHeight * 12,
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.3)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'BACK',
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
