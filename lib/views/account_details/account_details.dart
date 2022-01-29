import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four_musti/components/dropdown_list.dart';
import 'package:four_musti/components/next_button.dart';
import 'package:four_musti/components/plain_text_field.dart';

class AccountDetails extends StatelessWidget {
  AccountDetails({Key? key}) : super(key: key);
  String label = "Male";
  List<String> gender = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        width: double.infinity,
        color: const Color(0xFF25064C),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 60),
              const Text(
                "Welcome User",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 5),
              const Text(
                "Improve the profile win more attention",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              SvgPicture.asset("assets/images/profile_pic.svg"),
              const SizedBox(height: 30),
              dropDownList(context, "Gender", "Male", gender),
              const SizedBox(
                height: 20,
              ),
              plainTextField(
                labelText: 'Name',
                // controller: tutorName,
              ),
              const SizedBox(
                height: 20,
              ),
              plainTextField(
                labelText: 'Home Country',
                // controller: tutorName,
              ),
              const SizedBox(
                height: 20,
              ),
              plainTextField(
                labelText: 'Home Town',
                // controller: tutorName,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  // authController.datePicker(context);
                },
                child: Container(
                  // underline border
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: const [
                      Text(
                        "Date of Birth",
                        // authController.dob.value,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: next(
                  context,
                  text: "Next",
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
