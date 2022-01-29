import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:four_musti/views/login/login.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
        width: double.infinity,
        color: const Color(0xFF25064C),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 6),
            CarouselSlider(
              items: [
                //1st Image of Slider
                SvgPicture.asset(
                  'assets/images/onboarding.svg',
                ),

                //2nd Image of Slider
                SvgPicture.asset(
                  'assets/images/onboarding.svg',
                ),

                //3rd Image of Slider
                SvgPicture.asset(
                  'assets/images/onboarding.svg',
                ),

                //4th Image of Slider
                SvgPicture.asset(
                  'assets/images/onboarding.svg',
                ),

                //5th Image of Slider
                SvgPicture.asset(
                  'assets/images/onboarding.svg',
                ),
              ],
              //Slider Container properties
              options: CarouselOptions(
                height: 300.0,
                enlargeCenterPage: true,
                autoPlay: true,
                // aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.to(const Login());
              },
              child: const Text(
                'Get Started',
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shadowColor: Colors.transparent,
                primary: const Color(0xFF9768D1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
