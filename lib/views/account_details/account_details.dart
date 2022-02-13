// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four_musti/components/component.dart';
import 'package:four_musti/controller/account_details_controller.dart';
import 'package:four_musti/utils/constants.dart';
import 'package:four_musti/utils/themes.dart';
import 'package:get/get.dart';

class AccountDetails extends StatelessWidget {
  AccountDetails({Key? key}) : super(key: key);
  String label = "Male";
  List<String> gender = ["Male", "Female", "Others"];
  AccountDetailsController adc = Get.put(AccountDetailsController());
  @override
  Widget build(BuildContext context) {
    FocusScopeNode focusScope = FocusScope.of(context);
    adc.fadeIn();
    return Container(
      decoration: BoxDecoration(gradient: splashGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: gradientButton(
          context,
          text: "Continue",
          onPressed: () {
            Get.toNamed("INITIAL_FOLLOW");
          },
          cornerRadius: 0.0,
        ),
        body: GestureDetector(
          onTap: () {
            if (!focusScope.hasPrimaryFocus) {
              focusScope.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: deviceHeight * 0.10),
                  Text(
                    "Welcome User",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text("Improve the profile win more attention",
                      style: TextStyle(
                        fontSize: 14,
                        color: splashTextColor.withOpacity(0.9),
                      )),
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 6.0,
                          color: primaryColorII.withOpacity(0.07),
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset("assets/images/profile_pic.svg"),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 16.0,
                          color: primaryColorII.withOpacity(0.15),
                          spreadRadius: 12,
                        ),
                      ],
                    ),
                    child: dropDownList(context, "Gender", "Male", gender),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  plainTextField(
                    labelText: 'Name',
                    // controller: tutorName,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  plainTextField(
                      labelText: 'Email', inputType: TextInputType.emailAddress
                      // controller: tutorName,
                      ),
                  const SizedBox(
                    height: 15,
                  ),
                  plainTextField(
                      labelText: 'Mobile No', inputType: TextInputType.phone
                      // controller: tutorName,
                      ),
                  const SizedBox(
                    height: 15,
                  ),
                  plainTextField(
                    labelText: 'Country',
                    // controller: tutorName,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      // authController.datePicker(context);
                    },
                    child: Container(
                      // underline border
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: primaryColorI.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 14),
                      child: Row(
                        children: [
                          Text(
                            "Date of Birth",
                            // authController.dob.value,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.calendar_today_outlined,
                            color: lightVioletII,
                            size: 22,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Center(
                  //   child: next(
                  //     context,
                  //     text: "Continue",
                  //     onPressed: () {},
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 80,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
