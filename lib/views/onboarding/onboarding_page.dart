// ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:four_musti/controller/onboarding_controller.dart';
import 'package:four_musti/utils/constants.dart';
import 'package:four_musti/utils/themes.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  Onboarding({Key? key}) : super(key: key);
  OnboardingController onboardingController = Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    print("deviceHeight $deviceHeight deviceWidth $deviceWidth");
    return Container(
      decoration: BoxDecoration(gradient: splashGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          //new margin added
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              // CarouselSlider(
              //   items: [
              //     //1st Image of Slider
              //     SvgPicture.asset(
              //       'assets/images/onboarding.svg',
              //     ),

              //     //2nd Image of Slider
              //     SvgPicture.asset(
              //       'assets/images/onboarding.svg',
              //     ),

              //     //3rd Image of Slider
              //     SvgPicture.asset(
              //       'assets/images/onboarding.svg',
              //     ),

              //     //4th Image of Slider
              //     SvgPicture.asset(
              //       'assets/images/onboarding.svg',
              //     ),

              //     //5th Image of Slider
              //     SvgPicture.asset(
              //       'assets/images/onboarding.svg',
              //     ),
              //   ],
              //   //Slider Container properties
              //   options: CarouselOptions(
              //     height: deviceHeight * 0.417,
              //     enlargeCenterPage: true,
              //     autoPlay: true,
              //     // aspectRatio: 16 / 9,
              //     autoPlayCurve: Curves.fastOutSlowIn,
              //     enableInfiniteScroll: true,
              //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
              //     viewportFraction: 0.8,
              //   ),
              // ),
              PageView.builder(
                controller: onboardingController.pageController,
                onPageChanged: onboardingController.selectedPage,
                itemCount: onboardingController.onboardingInfoList.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: deviceHeight * 0.15, left: 20, right: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(3.5, 3.5),
                                  blurRadius: 16.0,
                                  color: primaryColorII.withOpacity(0.25),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              foregroundColor: Colors.transparent,
                              backgroundImage: AssetImage(onboardingController
                                  .onboardingInfoList[index].image!),
                              radius: 90,
                            ),
                          ),
                          SizedBox(
                            height: deviceHeight * 0.08,
                          ),
                          Text(
                            onboardingController
                                .onboardingInfoList[index].heading!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: splashTextColor),
                          ),
                          SizedBox(
                            height: deviceHeight * 0.020,
                          ),
                          Text(
                            onboardingController
                                .onboardingInfoList[index].description!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: splashTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: Container(
              //     margin: EdgeInsets.only(top: deviceHeight * 0.10),
              //     child: CircleAvatar(
              //       backgroundImage: AssetImage(
              //           "assets/images/onboarding/hannah_unsplash.jpg"),
              //       radius: 80,
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: onboardingController.nextPage,
                        child: Ink(
                          padding:
                              EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                          width: deviceWidth * 0.316,
                          decoration: BoxDecoration(
                              gradient: linearGradientI,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColorII.withOpacity(0.25),
                                  offset: Offset(
                                    2.5,
                                    2.5,
                                  ),
                                  blurRadius: 8.0,
                                ),
                              ]),
                          child: Obx(() {
                            return Center(
                              child: Text(
                                onboardingController.isLastpage
                                    ? 'Get Started'
                                    : 'Next',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: splashTextColor,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              onboardingController.onboardingInfoList.length,
                              (index) => Container(
                                    margin: EdgeInsets.only(right: 4),
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: onboardingController
                                                  .selectedPage.value ==
                                              index
                                          ? primaryColorI
                                          : hideColor,
                                    ),
                                  )),
                        );
                      })
                    ],
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
