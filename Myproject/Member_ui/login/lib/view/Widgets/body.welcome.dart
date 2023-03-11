import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/Widgets/background.welcome.dart';
import 'package:login/view/Widgets/rounderbutton.global.dart';
import 'package:login/view/login.view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:login/view/register.view.dart';

class BodyWelcome extends StatelessWidget {
  const BodyWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'WELCOME TO CMU LIBRARY',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.04),
          Image.asset(
            'assets/images/Chiang_Mai_University.png',
            width: size.width * 0.5,
          ),
          SizedBox(height: size.height * 0.05),
          RounderButton(
            text: 'SIGN IN',
            press: () {
              Get.to(() => MyLoginview());
            },
          ),
          RounderButton(
            text: 'SIGN UP',
            // color: kPrimaryLightColor,
            // textColor: kTextColor,
            press: () {
              Get.to(() => Mysignupview());
            },
          ),
        ]),
      ),
    );
  }
}
