import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        // height: double.infinity,
        width: double.infinity,
        color: Colors.black26,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Following",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "|",
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "For You",
                ),
              ],
            ),
            Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 1.6),
                      const Text("@karenne"),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("#avicii"),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("#avicii"),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      SvgPicture.asset(
                        "assets/images/User.svg",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SvgPicture.asset(
                        "assets/images/Heart.svg",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SvgPicture.asset(
                        "assets/images/Message.svg",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SvgPicture.asset(
                        "assets/images/Share.svg",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SvgPicture.asset(
                        "assets/images/Disc.svg",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
