import 'package:flutter/material.dart';
import 'package:four_musti/model/onboarding_data.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  List<OnboardingData> onboardingInfoList = [
    OnboardingData(
      image: "assets/images/onboarding/hannah_unsplash.jpg",
      heading: "Watch Your Favourite Stars",
      description:
          "You are most welcome to watch India's leading social media superstars collab in one platform..the magnificent 4musti..",
    ),
    OnboardingData(
      image: "assets/images/onboarding/hannah_unsplash.jpg",
      heading: "Create Video Content",
      description:
          "Open your mobile,Unfurl 4musti and create classic 4musti videos in minutes...Just Wow!! Right??",
    ),
    OnboardingData(
      image: "assets/images/onboarding/hannah_unsplash.jpg",
      heading: "Be A Star",
      description:
          "Want to become a celebrity??\nNo worries!! Post awesome videos and become the next superstar of India!!!!!",
    ),
    OnboardingData(
      image: "assets/images/onboarding/hannah_unsplash.jpg",
      heading: "Unlimited Live Streaming",
      description:
          "Enjoy the inexplicable experience round the clock anytime anywhere with the aura of your boon companion 4musti",
    ),
  ];

  RxInt selectedPage = 0.obs;
  PageController pageController = PageController();
  bool get isLastpage => selectedPage.value == onboardingInfoList.length - 1;

  nextPage() {
    if (isLastpage) {
      Get.offAllNamed("LOGIN");
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }
}
