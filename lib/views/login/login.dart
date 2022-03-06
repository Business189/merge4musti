// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four_musti/components/component.dart';
import 'package:four_musti/components/primary_rounded_button.dart';
import 'package:four_musti/components/bezierCurveUtilities/bezier_curve_i.dart';
import 'package:four_musti/controller/auth.dart';
import 'package:four_musti/utils/constants.dart';
import 'package:four_musti/utils/themes.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    print("DeviceWidth $deviceWidth and DeviceHeight $deviceHeight");
    return Container(
      decoration: BoxDecoration(gradient: splashGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        // bottomNavigationBar:
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              // width: deviceWidth * 0.65,
              // height: deviceWidth * 0.65,
              margin: EdgeInsets.only(top: deviceHeight * 0.1),
              child: Stack(
                children: [
                  SizedBox(
                    width: 325,
                    height: 325,
                    child: ClipShadowPath(
                      clipper: BezierClipperI(),
                      shadow: BoxShadow(
                        offset: Offset(3.5, 3.5),
                        blurRadius: 16.0,
                        color: primaryColorII.withOpacity(0.25),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: linearGradientII,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ClipShadowPath(
                      clipper: BezierClipperI(),
                      shadow: BoxShadow(
                        offset: Offset(3.5, 3.5),
                        blurRadius: 16.0,
                        color: primaryColorII.withOpacity(0.25),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: linearGradientII,
                        ),
                        height: 395,
                        width: 395,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/images/undraw_balloons_re_8ymj.svg',
                      width: deviceWidth * 0.65,
                      height: deviceWidth * 0.65,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            roundedElevatedButton(
              context,
              text: "Login with Google",
              cornerRadius: 4,
              onPressed: () async {
                await authController.signInwithGoogle();
                // Get.toNamed("ACCOUNT_DETAILS");
              },
            ),
            const SizedBox(height: 10),
            gradientButton(context, text: "Login with Phone", cornerRadius: 4,
                onPressed: () {
              Get.toNamed('MOBILE_LOGIN');
            })
          ],
        ),
      ),
    );
  }
}
