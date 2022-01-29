import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four_musti/components/primary_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: continueElevatedButton(
        context,
        text: "Login with Google",
        onPressed: () {},
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        width: double.infinity,
        color: const Color(0xFF25064C),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 120),
            SvgPicture.asset(
              'assets/images/login.svg',
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
