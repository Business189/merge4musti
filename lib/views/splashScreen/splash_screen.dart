// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:four_musti/controller/splash_controller.dart';
import 'package:four_musti/utils/themes.dart';
import 'package:four_musti/views/onboarding/onboarding_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    splashController.fadeIn();
    return Container(
      decoration: BoxDecoration(
        gradient: splashGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          // Temporary
          onTap: () {
            Get.toNamed("ONBOARDING");
          },
          child: Stack(
            children: [
              Obx(() {
                return AnimatedOpacity(
                  duration: Duration(milliseconds: 2500),
                  opacity: splashController.opacity.value,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              offset: Offset(4.5, 4.5),
                              blurRadius: 16.0,
                              color: primaryColorII.withOpacity(0.25),
                            ),
                          ]),
                          child: Image.asset(
                            'assets/images/logo_old.png',
                            height: 130,
                            width: 130,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Made in India",
                          style: GoogleFonts.satisfy(
                            fontSize: 22,
                            color: splashTextColor,
                            shadows: [
                              BoxShadow(
                                color: Colors.pink.shade200,
                                blurRadius: 5.0,
                                spreadRadius: 8.0,
                              ),
                            ],
                          ),
                          // style: TextStyle(
                          //   fontSize: 18,
                          //   color: Colors.white,
                          //   // fontWeight: FontWeight.bold,
                          // ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    left: 10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "4musti",
                        style: TextStyle(
                          fontSize: 24,
                          color: splashTextColor,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              color: Colors.yellow.shade700,
                              blurRadius: 5.0,
                              spreadRadius: 12.0,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "short video app",
                        style: TextStyle(
                          fontSize: 11,
                          color: splashTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
