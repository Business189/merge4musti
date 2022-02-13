// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:four_musti/components/component.dart';
import 'package:four_musti/utils/constants.dart';
import 'package:four_musti/utils/themes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class MobileLogin extends StatelessWidget {
  MobileLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusScopeNode focusScope = FocusScope.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(gradient: splashGradient),
        padding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 10),
        child: GestureDetector(
          onTap: () {
            if (!focusScope.hasPrimaryFocus) {
              focusScope.unfocus();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's sign you in.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "A beautiful world is waiting for you",
                    style: TextStyle(
                      color: splashTextColor.withOpacity(0.9),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // SvgPicture.asset("assets/reading.svg"),
              plainTextField(
                  labelText: "Mobile Number",
                  prefixIcon: Icons.phone,
                  inputType: TextInputType.phone),
              SizedBox(
                height: 15,
              ),
              plainTextField(
                labelText: "Password",
                prefixIcon: Icons.lock_outline_rounded,
                isPassword: true,
              ),
              SizedBox(
                height: 15,
              ),
              continueElevatedButton(
                context,
                text: "CONTINUE",
                onPressed: () {
                  Get.toNamed("ACCOUNT_DETAILS");
                },
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "Please enter your mobile number",
                      style: TextStyle(
                        color: lightVioletII,
                      ),
                    ),
                    Text(
                      "and password to continue",
                      style: TextStyle(
                        color: lightVioletII,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.toNamed('LOGIN');
                  },
                  child: Text(
                    "Sign In With Google",
                    // authController.dob.value,
                    style: TextStyle(
                      color: lightVioletII,
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
