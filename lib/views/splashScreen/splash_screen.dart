import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 23),
        color: const Color(0xFF25064C),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 3),
            Center(
              child: Image.asset(
                'assets/images/4musti_logo.jpeg',
                height: 130,
                width: 130,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "made in india",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "4 musti",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "short video app",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
