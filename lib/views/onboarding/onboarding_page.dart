import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            SizedBox(height: MediaQuery.of(context).size.height / 4),
            SvgPicture.asset(
              'assets/images/onboarding.svg',
            ),
            const SizedBox(height: 10),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Get Started',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
