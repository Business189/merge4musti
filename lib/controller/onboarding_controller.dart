import 'package:flutter/material.dart';
import 'package:four_musti/model/onboarding_data.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  List<OnboardingData> onboardingInfoList = [
    OnboardingData(
      image: "assets/images/onboarding/hannah_unsplash.jpg",
      heading: "Watch Your Favourite Stars",
      description: "India's leading social media stars collab in one platform",
    ),
    OnboardingData(
      image: "assets/images/onboarding/hannah_unsplash.jpg",
      heading: "Create Video Content",
      description:
          "A fully featured platform for making professional, musti videos in minutes.",
    ),
    OnboardingData(
      image: "assets/images/onboarding/hannah_unsplash.jpg",
      heading: "Be A Star",
      description: "Create awesome videos and be the next superstar in India",
    ),
    OnboardingData(
      image: "assets/images/onboarding/hannah_unsplash.jpg",
      heading: "Unlimited Live Streaming",
      description:
          "Experience unlimited 24/7 live streaming experience with 4musti",
    ),
  ];

  RxInt selectedPage = 0.obs;
  PageController pageController = PageController();
  bool get isLastpage => selectedPage.value == onboardingInfoList.length - 1;

  nextPage() {
    if (isLastpage) {
      Get.offAllNamed("HOME");
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }
}
